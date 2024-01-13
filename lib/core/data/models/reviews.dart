import 'package:json_annotation/json_annotation.dart';

part 'reviews.g.dart';

@JsonSerializable()
class Reviews {
  @JsonKey(name: "count")
  int? count;
  @JsonKey(name: "next")
  String? next;
  @JsonKey(name: "previous")
  dynamic previous;
  @JsonKey(name: "results")
  List<Review> results;

  Reviews({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsToJson(this);
}

@JsonSerializable()
class Review {
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
  List<Images>? images;
  @JsonKey(name: "approved")
  bool? approved;

  Review({
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

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

@JsonSerializable()
class Images {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "image")
  String image;

  Images({
    required this.id,
    required this.image,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}
