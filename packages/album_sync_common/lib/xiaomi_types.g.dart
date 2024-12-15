// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xiaomi_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

XiaomiAlbumResult _$XiaomiAlbumResultFromJson(Map<String, dynamic> json) =>
    XiaomiAlbumResult(
      result: json['result'] as String?,
      retriable: json['retriable'] as bool?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      description: json['description'] as String?,
      ts: (json['ts'] as num?)?.toInt(),
    );

Map<String, dynamic> _$XiaomiAlbumResultToJson(XiaomiAlbumResult instance) =>
    <String, dynamic>{
      'result': instance.result,
      'retriable': instance.retriable,
      'code': instance.code,
      'data': instance.data,
      'description': instance.description,
      'ts': instance.ts,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      albums: (json['albums'] as List<dynamic>?)
          ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLastPage: json['isLastPage'] as bool?,
      indexHash: (json['indexHash'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'albums': instance.albums,
      'isLastPage': instance.isLastPage,
      'indexHash': instance.indexHash,
    };

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      mediaCount: (json['mediaCount'] as num?)?.toInt(),
      albumId: json['albumId'] as String?,
      thumbnails: (json['thumbnails'] as List<dynamic>?)
          ?.map((e) => Thumbnail.fromJson(e as Map<String, dynamic>))
          .toList(),
      userId: (json['userId'] as num?)?.toInt(),
      lastUpdateTime: (json['lastUpdateTime'] as num?)?.toInt(),
      namePinyin: json['namePinyin'] == null
          ? null
          : NamePinyin.fromJson(json['namePinyin'] as Map<String, dynamic>),
      albumType: json['albumType'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'mediaCount': instance.mediaCount,
      'albumId': instance.albumId,
      'thumbnails': instance.thumbnails,
      'userId': instance.userId,
      'lastUpdateTime': instance.lastUpdateTime,
      'namePinyin': instance.namePinyin,
      'albumType': instance.albumType,
      'name': instance.name,
    };

NamePinyin _$NamePinyinFromJson(Map<String, dynamic> json) => NamePinyin(
      sortkey: json['sortkey'] as String?,
      pinyin: json['pinyin'] as String?,
      spinyin: json['spinyin'] as String?,
    );

Map<String, dynamic> _$NamePinyinToJson(NamePinyin instance) =>
    <String, dynamic>{
      'sortkey': instance.sortkey,
      'pinyin': instance.pinyin,
      'spinyin': instance.spinyin,
    };

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) => Thumbnail(
      orientation: (json['orientation'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'orientation': instance.orientation,
      'url': instance.url,
    };
