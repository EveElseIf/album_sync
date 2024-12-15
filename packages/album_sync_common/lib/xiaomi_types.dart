import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'xiaomi_types.g.dart';

@JsonSerializable()
class XiaomiAlbumResult extends Equatable {
  XiaomiAlbumResult({
    required this.result,
    required this.retriable,
    required this.code,
    required this.data,
    required this.description,
    required this.ts,
  });

  final String? result;
  final bool? retriable;
  final int? code;
  final Data? data;
  final String? description;
  final int? ts;

  XiaomiAlbumResult copyWith({
    String? result,
    bool? retriable,
    int? code,
    Data? data,
    String? description,
    int? ts,
  }) {
    return XiaomiAlbumResult(
      result: result ?? this.result,
      retriable: retriable ?? this.retriable,
      code: code ?? this.code,
      data: data ?? this.data,
      description: description ?? this.description,
      ts: ts ?? this.ts,
    );
  }

  factory XiaomiAlbumResult.fromJson(Map<String, dynamic> json) => _$XiaomiAlbumResultFromJson(json);

  Map<String, dynamic> toJson() => _$XiaomiAlbumResultToJson(this);

  @override
  String toString(){
    return "$result, $retriable, $code, $data, $description, $ts, ";
  }

  @override
  List<Object?> get props => [
    result, retriable, code, data, description, ts, ];
}

@JsonSerializable()
class Data extends Equatable {
  Data({
    required this.albums,
    required this.isLastPage,
    required this.indexHash,
  });

  final List<Album>? albums;
  final bool? isLastPage;
  final int? indexHash;

  Data copyWith({
    List<Album>? albums,
    bool? isLastPage,
    int? indexHash,
  }) {
    return Data(
      albums: albums ?? this.albums,
      isLastPage: isLastPage ?? this.isLastPage,
      indexHash: indexHash ?? this.indexHash,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  String toString(){
    return "$albums, $isLastPage, $indexHash, ";
  }

  @override
  List<Object?> get props => [
    albums, isLastPage, indexHash, ];
}

@JsonSerializable()
class Album extends Equatable {
  Album({
    required this.mediaCount,
    required this.albumId,
    required this.thumbnails,
    required this.userId,
    required this.lastUpdateTime,
    required this.namePinyin,
    required this.albumType,
    required this.name,
  });

  final int? mediaCount;
  final String? albumId;
  final List<Thumbnail>? thumbnails;
  final int? userId;
  final int? lastUpdateTime;
  final NamePinyin? namePinyin;
  final String? albumType;
  final String? name;

  Album copyWith({
    int? mediaCount,
    String? albumId,
    List<Thumbnail>? thumbnails,
    int? userId,
    int? lastUpdateTime,
    NamePinyin? namePinyin,
    String? albumType,
    String? name,
  }) {
    return Album(
      mediaCount: mediaCount ?? this.mediaCount,
      albumId: albumId ?? this.albumId,
      thumbnails: thumbnails ?? this.thumbnails,
      userId: userId ?? this.userId,
      lastUpdateTime: lastUpdateTime ?? this.lastUpdateTime,
      namePinyin: namePinyin ?? this.namePinyin,
      albumType: albumType ?? this.albumType,
      name: name ?? this.name,
    );
  }

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);

  @override
  String toString(){
    return "$mediaCount, $albumId, $thumbnails, $userId, $lastUpdateTime, $namePinyin, $albumType, $name, ";
  }

  @override
  List<Object?> get props => [
    mediaCount, albumId, thumbnails, userId, lastUpdateTime, namePinyin, albumType, name, ];
}

@JsonSerializable()
class NamePinyin extends Equatable {
  NamePinyin({
    required this.sortkey,
    required this.pinyin,
    required this.spinyin,
  });

  final String? sortkey;
  final String? pinyin;
  final String? spinyin;

  NamePinyin copyWith({
    String? sortkey,
    String? pinyin,
    String? spinyin,
  }) {
    return NamePinyin(
      sortkey: sortkey ?? this.sortkey,
      pinyin: pinyin ?? this.pinyin,
      spinyin: spinyin ?? this.spinyin,
    );
  }

  factory NamePinyin.fromJson(Map<String, dynamic> json) => _$NamePinyinFromJson(json);

  Map<String, dynamic> toJson() => _$NamePinyinToJson(this);

  @override
  String toString(){
    return "$sortkey, $pinyin, $spinyin, ";
  }

  @override
  List<Object?> get props => [
    sortkey, pinyin, spinyin, ];
}

@JsonSerializable()
class Thumbnail extends Equatable {
  Thumbnail({
    required this.orientation,
    required this.url,
  });

  final int? orientation;
  final String? url;

  Thumbnail copyWith({
    int? orientation,
    String? url,
  }) {
    return Thumbnail(
      orientation: orientation ?? this.orientation,
      url: url ?? this.url,
    );
  }

  factory Thumbnail.fromJson(Map<String, dynamic> json) => _$ThumbnailFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);

  @override
  String toString(){
    return "$orientation, $url, ";
  }

  @override
  List<Object?> get props => [
    orientation, url, ];
}