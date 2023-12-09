class ReviewsResponse {
  num count;
  dynamic next;
  String previous;
  List<Reviews> results;

  ReviewsResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory ReviewsResponse.fromJson(Map<String, dynamic> json) =>
      ReviewsResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Reviews>.from(json["results"].map((x) => Reviews.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Reviews {
  num id;
  String resort;
  String authorName;
  String authorLastname;
  String text;
  num rating;
  DateTime? addAt;
  String resortName;
  // List<String> images;

  Reviews({
    required this.id,
    required this.resort,
    required this.authorName,
    required this.authorLastname,
    required this.text,
    required this.rating,
    required this.addAt,
    required this.resortName,
    // required this.images,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        id: json["id"],
        resort: json["resort"],
        authorName: json["author_name"],
        authorLastname: json["author_lastname"],
        text: json["text"],
        rating: json["rating"],
        addAt: DateTime.parse(json["add_at"]),
        resortName: json["resort_name"],
        // images: List<dynamic>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "resort": resort,
        "author_name": authorName,
        "author_lastname": authorLastname,
        "text": text,
        "rating": rating,
        "add_at": addAt?.toIso8601String(),
        "resort_name": resortName,
        // "images": List<String>.from(images.map((x) => x)),
      };
}
