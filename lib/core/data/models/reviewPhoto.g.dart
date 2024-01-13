// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviewPhoto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewPhoto _$ReviewPhotoFromJson(Map<String, dynamic> json) => ReviewPhoto(
      id: json['id'] as int?,
      resort: json['resort'] as String?,
      resortName: json['resort_name'] as String?,
      resortRegion: json['resort_region'] as String?,
      authorName: json['author_name'] as String?,
      authorLastname: json['author_lastname'] as String?,
      text: json['text'] as String?,
      rating: json['rating'] as int?,
      addAt: json['add_at'] == null
          ? null
          : DateTime.parse(json['add_at'] as String),
      images: json['images'],
      approved: json['approved'] as bool?,
    );

Map<String, dynamic> _$ReviewPhotoToJson(ReviewPhoto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resort': instance.resort,
      'resort_name': instance.resortName,
      'resort_region': instance.resortRegion,
      'author_name': instance.authorName,
      'author_lastname': instance.authorLastname,
      'text': instance.text,
      'rating': instance.rating,
      'add_at': instance.addAt?.toIso8601String(),
      'images': instance.images,
      'approved': instance.approved,
    };
