import 'package:freezed_annotation/freezed_annotation.dart';

part 'core.g.dart';

part 'core.freezed.dart';

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

@freezed
class Album with _$Album {
  const factory Album({
    required String id,
    required String userId,
    required String name,
    required int mediaCount,
    required DateTime lastUpdateTime,
    String? thumbnailUrl,
    dynamic extra,
  }) = _Album;

  factory Album.fromJson(Map<String, Object?> json) => _$AlbumFromJson(json);
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
  final bool unauthorized;

  AlbumServiceRequestException(
      super.message, super.serviceName, super.stackTrace,
      {super.innerException, this.unauthorized = false});
}
