import 'package:json_annotation/json_annotation.dart';

part 'core.g.dart';

abstract interface class AlbumService {
  String get serviceName;

  Future<List<Album>> getAlbums();

  Future reload();

  Future init();

  AlbumServiceStatus get status;
}

enum AlbumServiceStatus {
  created,
  initialized,
  disposed,
}

@JsonSerializable()
class Album {
  String? thumbnailUrl;
  String id, userId, name;
  int mediaCount;
  DateTime lastUpdateTime;
  dynamic extra;

  Album({
    required this.id,
    required this.userId,
    required this.name,
    required this.mediaCount,
    required this.lastUpdateTime,
    this.thumbnailUrl,
    this.extra,
  });
}

class AlbumServiceException implements Exception {
  final String message;
  final String serviceName;
  final StackTrace stackTrace;
  final Object? innerException;

  AlbumServiceException(this.message, this.serviceName, this.stackTrace,
      {this.innerException});

  @override
  String toString() =>
      "$serviceName: $message\nStack trace: $stackTrace\nInner Exception: $innerException";
}

class AlbumServiceRequestException extends AlbumServiceException {
  AlbumServiceRequestException(
      super.message, super.serviceName, super.stackTrace,
      {super.innerException});
}
