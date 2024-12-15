import 'dart:io';

typedef Cookies = List<Cookie>;

extension Serialization on Cookies {
  String serialize() {
    final buf = StringBuffer();
    for (var cookie in this) {
      buf.write(cookie.toString());
      buf.writeCharCode(1);
    }
    return buf.toString();
  }

  static Cookies deserialize(String content) {
    final lines = content.split("\x01").where((x) => x != "").toList();
    final Cookies ret = [];
    for (var line in lines) {
      var c = Cookie.fromSetCookieValue(line);
      ret.add(c);
    }
    return ret;
  }
}
