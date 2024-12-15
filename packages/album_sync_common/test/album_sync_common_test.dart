import 'dart:io';

import 'package:album_sync_common/util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("cookie serialization", () {
    Cookies c = [
      Cookie.fromSetCookieValue(
          "sessionId=abc123; Path=/; HttpOnly"),
      Cookie.fromSetCookieValue(
          "user=JohnDoe; Expires=Fri, 15-Jan-2025 12:00:00 GMT; Path=/"),
      Cookie.fromSetCookieValue(
          "token=xyz456; Path=/; Secure; HttpOnly; SameSite=Strict"),
    ];
    final serialized = c.serialize();
    Cookies loaded = Serialization.deserialize(serialized);
    expect(c.length, loaded.length);
  });
}
