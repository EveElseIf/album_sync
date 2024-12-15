import 'package:album_sync_app/database.dart';
import 'package:album_sync_app/pages/xiaomi_login.dart';
import 'package:album_sync_common/core.dart';
import 'package:album_sync_common/xiaomi.dart';
import 'package:flutter/material.dart';

class ImageGridPage extends StatefulWidget {
  const ImageGridPage({super.key});

  @override
  State<ImageGridPage> createState() => _ImageGridPageState();
}

class _ImageGridPageState extends State<ImageGridPage> {
  List<String?> imageUrls = [];
  bool isLoading = false;
  late AlbumService service;

  Future<void> fetchImageUrls() async {
    setState(() {
      isLoading = true;
    });
    try {
      // fetch from Xiaomi
      if (service.status == AlbumServiceStatus.created) {
        await service.init();
      }
      final result = await service.getAlbums();
      final urls = result.map((x) => x.thumbnailUrl).toList();
      setState(() {
        imageUrls = urls;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading images: $error')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    initService();
  }

  Future initService() async {
    final db = AppDatabase();
    var cfg = await db.select(db.xiaomiConfigItem).getSingleOrNull();
    if (cfg == null || !cfg.ready) {
      while (!mounted) {
        await Future.delayed(Duration(seconds: 1));
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const XiaomiLoginPage()),
      );
    } else {
      service = XiaomiAlbumService(
          XiaomiConfig(cfg.username, cfg.password, cfg.deviceId));
      await service.init();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Grid'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: isLoading ? null : fetchImageUrls,
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Load Images'),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Image.network(
                  imageUrls[index] ?? "",
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.error));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
