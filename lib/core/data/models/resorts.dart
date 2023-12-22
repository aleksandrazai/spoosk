import 'dart:convert';

Resorts resortsFromJson(String str) => Resorts.fromJson(json.decode(str));

String resortsToJson(Resorts data) => json.encode(data.toJson());

class Resorts {
  int count;
  String next;
  String previous;
  List<Result> results;

  Resorts({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory Resorts.fromJson(Map<String, dynamic> json) => Resorts(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class Result {
  String idResort;
  String name;
  String region;
  num rating;
  String image;
  num trailLength;
  num heightDifference;
  num skipass;
  num trailNumber;

  Result({
    required this.idResort,
    required this.name,
    required this.region,
    required this.rating,
    required this.image,
    required this.trailLength,
    required this.heightDifference,
    required this.skipass,
    required this.trailNumber,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        idResort: json["id_resort"],
        name: json["name"],
        region: json["region"],
        rating: json["rating"],
        image: json["image"],
        trailLength: json["trail_length"],
        heightDifference: json["height_difference"],
        skipass: json["skipass"],
        trailNumber: json["trail_number"],
      );

  Map<String, dynamic> toMap() => {
        "id_resort": idResort,
        "name": name,
        "region": region,
        "rating": rating,
        "image": image,
        "trail_length": trailLength,
        "height_difference": heightDifference,
        "skipass": skipass,
        "trail_number": trailNumber,
      };
}
