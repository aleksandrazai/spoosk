import 'dart:convert';

class Resorts {
  int count;
  dynamic next;
  dynamic previous;
  List<Resort> results;

  Resorts({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory Resorts.fromJson(String str) => Resorts.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Resorts.fromMap(Map<String, dynamic> json) => Resorts(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Resort>.from(json["results"].map((x) => Resort.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class Resort {
  String idResort;
  String name;
  String region;
  int rating;
  int numberReviews;
  String image;
  num trailLength;
  num heightDifference;
  num skipass;
  int trailNumber;
  bool inFavorites;

  Resort({
    required this.idResort,
    required this.name,
    required this.region,
    required this.rating,
    required this.numberReviews,
    required this.image,
    required this.trailLength,
    required this.heightDifference,
    required this.skipass,
    required this.trailNumber,
    required this.inFavorites,
  });

  factory Resort.fromJson(String str) => Resort.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Resort.fromMap(Map<String, dynamic> json) => Resort(
        idResort: json["id_resort"],
        name: json["name"],
        region: json["region"],
        rating: json["rating"],
        numberReviews: json["number_reviews"],
        image: json["image"],
        trailLength: json["trail_length"],
        heightDifference: json["height_difference"],
        skipass: json["skipass"],
        trailNumber: json["trail_number"],
        inFavorites: json["in_favorites"],
      );

  Map<String, dynamic> toMap() => {
        "id_resort": idResort,
        "name": name,
        "region": region,
        "rating": rating,
        "number_reviews": numberReviews,
        "image": image,
        "trail_length": trailLength,
        "height_difference": heightDifference,
        "skipass": skipass,
        "trail_number": trailNumber,
        "in_favorites": inFavorites,
      };
}
