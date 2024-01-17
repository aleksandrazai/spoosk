import 'dart:io';

class TestReviews {
  String resort;
  String text;
  int rating;
  List<File> images;

  TestReviews({
    required this.resort,
    required this.text,
    required this.rating,
    required this.images,
  });

  factory TestReviews.fromJson(Map<String, dynamic> json) {
    return TestReviews(
      resort: json["resort"],
      text: json["text"],
      rating: json["rating"],
      images: (json["images"] as List<dynamic>)
          .map((imagePath) => File(imagePath))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "resort": resort,
        "text": text,
        "rating": rating,
        "images": List<dynamic>.from(images.map((image) => image.path)),
      };
}

class ReviewImage {
  ReviewImage();

  factory ReviewImage.fromJson(Map<String, dynamic> json) => ReviewImage();

  Map<String, dynamic> toJson() => {};
}
