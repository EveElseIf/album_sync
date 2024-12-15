import 'package:album_sync_common/core.dart';
import 'package:album_sync_common/xiaomi.dart';
import 'package:dotenv/dotenv.dart';

void main() async {
  final env = DotEnv()..load();
  final cfg = XiaomiConfig(env["XIAOMI_USERNAME"]!, env["XIAOMI_PASSWORD"]!,
      env["XIAOMI_DEVICEID"]!);
  var srvc = XiaomiAlbumService(cfg, proxy: "127.0.0.1:8888") as AlbumService;

  await srvc.init();
  var albums = await srvc.getAlbums();
  print(albums);

  final cookies = await (srvc as XiaomiAlbumService).saveCookies();
  print(cookies);
  srvc = XiaomiAlbumService(cfg, cookies: cookies, proxy: "127.0.0.1:8888")
      as AlbumService;

  await srvc.init();
  albums = await srvc.getAlbums();
  print(albums);
}
