import 'package:album_sync_common/core.dart';
import 'package:album_sync_common/util.dart';
import 'package:album_sync_common/xiaomi.dart';
import 'package:dotenv/dotenv.dart';

void main() async {
  final env = DotEnv()..load();
  final cfg = XiaomiConfig(env["XIAOMI_USERNAME"]!, env["XIAOMI_PASSWORD"]!,
      env["XIAOMI_DEVICEID"]!);
  AlbumService service;
  Cookies cookies;
  if (env["XIAOMI_COOKIE"] != null && env["XIAOMI_COOKIE"] != "") {
    cookies = Serialization.deserialize(env["XIAOMI_COOKIE"]!);
  } else {
    service = XiaomiAlbumService(cfg);
    await service.init();

    cookies = await (service as XiaomiAlbumService).saveCookies();
    print(
        "you can write the line below to .env XIAOMI_COOKIE, which is encoded cookies for future use.");
    print(cookies.serialize());
  }
  service = XiaomiAlbumService(cfg, cookies: cookies) as AlbumService;

  await service.init();
  var albums = await service.getAlbums();
  print(albums);
}
