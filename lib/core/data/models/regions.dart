class Regions {
  String region;

  Regions({
    required this.region,
  });

  factory Regions.fromJson(Map<String, dynamic> json) => Regions(
        region: json["region"],
      );

  Map<String, dynamic> toJson() => {
        "region": region,
      };
}
