// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      id: json['id'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      mediaCount: (json['mediaCount'] as num).toInt(),
      lastUpdateTime: DateTime.parse(json['lastUpdateTime'] as String),
      extra: json['extra'],
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'thumbnailUrl': instance.thumbnailUrl,
      'userId': instance.userId,
      'name': instance.name,
      'mediaCount': instance.mediaCount,
      'lastUpdateTime': instance.lastUpdateTime.toIso8601String(),
      'extra': instance.extra,
    };