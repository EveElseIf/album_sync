import 'package:album_sync_app/database.dart';
import 'package:album_sync_app/pages/image_grid_page.dart';
import 'package:album_sync_common/xiaomi.dart';
import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';

class XiaomiLoginPage extends StatefulWidget {
  const XiaomiLoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _XiaomiLoginPageState();
}

class _XiaomiLoginPageState extends State<XiaomiLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _deviceIdController = TextEditingController();

  Future<void> _onSubmit() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    String deviceId = _deviceIdController.text;

    var cfg = XiaomiConfig(username, password, deviceId);
    try {
      var service = XiaomiAlbumService(cfg);
      await service.init();
      // login ok, save credentials
      final db = AppDatabase();
      await db.into(db.xiaomiConfigItem).insertOnConflictUpdate(
            XiaomiConfigItemCompanion.insert(
              id: d.Value(1),
              ready: true,
              username: username,
              password: password,
              deviceId: deviceId,
            ),
          );
      service.dispose();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const ImageGridPage()),
      );
    } catch (ex) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(ex.toString())));
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xiaomi Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: _deviceIdController,
              decoration: InputDecoration(labelText: 'Device ID'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onSubmit,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
