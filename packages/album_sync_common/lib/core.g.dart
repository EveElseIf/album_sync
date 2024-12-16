// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumImpl _$$AlbumImplFromJson(Map<String, dynamic> json) => _$AlbumImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      mediaCount: (json['mediaCount'] as num).toInt(),
      lastUpdateTime: DateTime.parse(json['lastUpdateTime'] as String),
      thumbnailUrl: json['thumbnailUrl'] as String?,
      extra: json['extra'],
    );

Map<String, dynamic> _$$AlbumImplToJson(_$AlbumImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'mediaCount': instance.mediaCount,
      'lastUpdateTime': instance.lastUpdateTime.toIso8601String(),
      'thumbnailUrl': instance.thumbnailUrl,
      'extra': instance.extra,
    };
