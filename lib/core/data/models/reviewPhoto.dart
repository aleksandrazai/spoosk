import 'package:json_annotation/json_annotation.dart';

part 'reviewPhoto.g.dart';

@JsonSerializable()
class ReviewPhoto {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "resort")
  String? resort;
  @JsonKey(name: "resort_name")
  String? resortName;
  @JsonKey(name: "resort_region")
  String? resortRegion;
  @JsonKey(name: "author_name")
  String? authorName;
  @JsonKey(name: "author_lastname")
  String? authorLastname;
  @JsonKey(name: "text")
  String? text;
  @JsonKey(name: "rating")
  int? rating;
  @JsonKey(name: "add_at")
  DateTime? addAt;
  @JsonKey(name: "images")
  // Тут должен быть тип FormData
  dynamic images;
  @JsonKey(name: "approved")
  bool? approved;

  ReviewPhoto({
    required this.id,
    required this.resort,
    required this.resortName,
    required this.resortRegion,
    required this.authorName,
    required this.authorLastname,
    required this.text,
    required this.rating,
    required this.addAt,
    required this.images,
    required this.approved,
  });

  factory ReviewPhoto.fromJson(Map<String, dynamic> json) =>
      _$ReviewPhotoFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewPhotoToJson(this);
}
