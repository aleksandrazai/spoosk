// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reviews _$ReviewsFromJson(Map<String, dynamic> json) => Reviews(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'],
      results: (json['results'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewsToJson(Reviews instance) => <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
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
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      approved: json['approved'] as bool?,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
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

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      id: json['id'] as int,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
