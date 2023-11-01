class Resorts {
  String name;
  String region;
  String image;
  num trailLength;
  num heightDifference;
  num skipass;
  num trailNumber;

  Resorts({
    required this.name,
    required this.region,
    required this.image,
    required this.trailLength,
    required this.heightDifference,
    required this.skipass,
    required this.trailNumber,
  });

  factory Resorts.fromJson(Map<String, dynamic> json) => Resorts(
        trailLength: json["trail_length"],
        trailNumber: json["trail_number"],
        skipass: json["skipass"],
        heightDifference: json["height_difference"],
        name: json["name"],
        region: json["region"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "trail_length": trailLength,
        "trail_number": trailNumber,
        "skipass": skipass,
        "height_difference": heightDifference,
        "name": name,
        "region": region,
        "image": image,
      };
}
