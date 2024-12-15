import 'dart:convert';
import 'dart:io';

import 'package:album_sync_common/core.dart';
import 'package:album_sync_common/util.dart';
import 'package:album_sync_common/xiaomi_types.dart' as json_types;
import 'package:cookie_jar/cookie_jar.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class XiaomiConfig {
  final String username, password, deviceId;
  XiaomiConfig(this.username, this.password, this.deviceId);
}

class XiaomiAlbumService implements AlbumService {
  final _XiaomiConnector _connector;
  Dio get dio => _connector.dio;
  final Cookies? cookies;

  XiaomiAlbumService(
    XiaomiConfig config, {
    String? proxy,
    String agent =
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36",
    this.cookies,
  }) : _connector = _XiaomiConnector(config, agent, proxy: proxy);

  void dispose() {
    _connector.dispose();
  }

  Future<Cookies> saveCookies() async {
    final cookies = await _connector.cookieJar
        .loadForRequest(Uri.parse("https://i.mi.com"));
    return cookies;
  }

  Future loadCookies(Cookies cookies) async {
    await _connector.cookieJar
        .saveFromResponse(Uri.parse("https://i.mi.com"), cookies);
  }

  @override
  Future reload() async {
    try {
      await _connector.init();
      await _connector.loginStep1();
      await _connector.loginStep2();
      await _connector.loginStep3();
    } catch (ex) {
      throw Exception(["Login failed", ex]);
    }
  }

  @override
  Future init() async {
    if (cookies != null) {
      await loadCookies(cookies!);
    } else {
      await reload();
    }
  }

  @override
  Future<List<Album>> getAlbums() async {
    final url =
        "https://i.mi.com/gallery/user/album/list?ts=${DateTime.timestamp().millisecondsSinceEpoch}&pageNum=0&pageSize=100&isShared=false&numOfThumbnails=1";
    final headers = {
      "cookie": "i.mi.com_istrudev=true; i.mi.com_isvalid_servicetoken=true",
    };
    try {
      final resp = await dio.get(
        url,
        options: Options(headers: headers, responseType: ResponseType.json),
      );
      final result = json_types.XiaomiAlbumResult.fromJson(resp.data);
      final ret = result.data?.albums
          ?.map(
            (x) => Album(
              id: x.albumId!,
              thumbnailUrl: x.thumbnails?.firstOrNull?.url,
              userId: x.userId.toString(),
              name: x.name ?? "",
              mediaCount: x.mediaCount!,
              lastUpdateTime:
                  DateTime.fromMillisecondsSinceEpoch(x.lastUpdateTime!),
            ),
          )
          .toList();
      if (ret == null) {
        throw Exception("failed to map result: $result");
      }
      return ret;
    } catch (ex) {
      throw AlbumServiceRequestException(
          "fail to get albums", serviceName, StackTrace.current,
          innerException: ex);
    }
  }

  @override
  String get serviceName => "XIAOMI";
}

class _XiaomiConnector {
  final XiaomiConfig config;
  final Dio dio = Dio();
  final CookieJar cookieJar = CookieJar();
  final String agent;
  String sign = "",
      ssecurity = "",
      userId = "",
      cUserId = "",
      passToken = "",
      location = "",
      code = "",
      serviceToken = "";
  Map<String, String> params = {};

  _XiaomiConnector(
    this.config,
    this.agent, {
    String? proxy,
  }) {
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final c = HttpClient();
        if (proxy != null) {
          c.findProxy = (uri) {
            return "PROXY $proxy";
          };
        }
        return c;
      },
    );
    dio.interceptors.add(CookieManager(cookieJar));
  }

  void dispose() {
    dio.close();
  }

  Future init() async {
    await cookieJar.deleteAll();
    await cookieJar.saveFromResponse(Uri.parse("https://mi.com"),
        [Cookie("deviceId", config.deviceId)..domain = "mi.com"]);
    await cookieJar.saveFromResponse(Uri.parse("https://xiaomi.com"),
        [Cookie("deviceId", config.deviceId)..domain = "xiaomi.com"]);
  }

  Future loginStep1() async {
    var url =
        "https://i.mi.com/api/user/login?ts=${DateTime.timestamp().millisecondsSinceEpoch}&followUp=https://i.mi.com/&_locale=zh_CN";
    final headers = {
      "User-Agent": agent,
      "Content-Type": "application/x-www-form-urlencoded",
      'Referer': 'https://i.mi.com/',
      'Accept-Encoding': 'gzip, deflate, br',
      'Accept-Language': 'zh-CN,zh;q=0.9,en;q=0.8',
      'sec-ch-ua':
          '"Chromium";v="88", "Google Chrome";v="88", ";Not A Brand";v="99"',
      'sec-ch-ua-mobile': '?0',
      'Sec-Fetch-Site': 'same-origin',
      'Sec-Fetch-Mode': 'cors',
      'Sec-Fetch-Dest': 'empty',
    };
    final options = Options(
      headers: headers,
      responseType: ResponseType.plain,
    );

    var resp = await dio.get(
      url,
      options: options,
    );
    String loginUrl;
    {
      if (resp.statusCode != 200) throw Exception("step 1 failed");
      var j = json.decode(resp.data.toString()) as Map<String, dynamic>;
      if (!j.containsKey("data")) throw Exception("step 1 failed");
      j = j["data"] as Map<String, dynamic>;
      if (!j.containsKey("loginUrl")) throw Exception("step 1 failed");
      loginUrl = j["loginUrl"] as String;
    }

    resp = await dio.get(
      loginUrl,
      options: options.copyWith(
        followRedirects: false,
        validateStatus: (code) => code == 302,
      ),
    );
    url = resp.headers.value("Location")!;
    resp = await dio.get(
      url,
      options: options,
    );
    if (resp.statusCode != 200) throw Exception("step 1 failed");
    params = resp.realUri.queryParameters;
  }

  Future loginStep2() async {
    var url = "https://account.xiaomi.com/pass/serviceLoginAuth2";
    final headers = {
      "User-Agent": agent,
      "Content-Type": "application/x-www-form-urlencoded"
    };
    final fields = {
      "hash":
          md5.convert(utf8.encode(config.password)).toString().toUpperCase(),
      "serviceParam": params["serviceParam"],
      "callback": params["callback"],
      "qs": params["qs"],
      "sid": params["sid"],
      "user": config.username,
      "_sign": sign,
      "_json": "true"
    };
    var resp = await dio.post(
      url,
      data: fields,
      options: Options(
        headers: headers,
        contentType: headers["Content-Type"],
        responseType: ResponseType.plain,
      ),
    );
    if (resp.statusCode != 200) throw Exception("step 2 failed");
    var j = json.decode(resp.data.toString().replaceAll("&&&START&&&", ""))
        as Map<String, dynamic>;
    if (!j.containsKey("ssecurity")) throw Exception("step 2 failed");
    ssecurity = j["ssecurity"].toString();
    userId = j["userId"].toString();
    cUserId = j["cUserId"].toString();
    passToken = j["passToken"].toString();
    location = j["location"].toString();
    code = j["code"].toString();
  }

  Future loginStep3() async {
    final headers = {
      "User-Agent": agent,
      'Referer': 'https://i.mi.com/',
      'Upgrade-Insecure-Requests': '1',
      'Accept':
          'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
      'Accept-Encoding': 'gzip, deflate, br',
      'Accept-Language': 'zh-CN,zh;q=0.9,en;q=0.8',
      'Sec-Fetch-Site': 'cross-site',
      'Sec-Fetch-Mode': 'navigate',
      'Sec-Fetch-User': '?1',
      'Sec-Fetch-Dest': 'document',
      'sec-ch-ua':
          '"Chromium";v="88", "Google Chrome";v="88", ";Not A Brand";v="99"',
      'sec-ch-ua-mobile': '?0',
      'Cookie': 'iplocale=zh_CN; uLocale=zh_CN',
    };
    var resp = await dio.get(
      location,
      options: Options(
        headers: headers,
        followRedirects: false,
        validateStatus: (c) => c == 302,
      ),
    );
    var token = resp.headers.map["Set-Cookie"]
        ?.firstWhere((x) {
          return x.split(";").first.split("=").first == "serviceToken";
        })
        .split(";")
        .first
        .split("=")[1];
    if (token == null) throw Exception("step 3 failed");
    serviceToken = token;
  }
}
