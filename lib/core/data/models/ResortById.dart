import 'package:meta/meta.dart';
import 'dart:convert';

class ResortById {
  String idResort;
  num trailLength;
  num trailNumber;
  num skipass;
  num heightDifference;
  num greenTrails;
  num blueTrails;
  num redTrails;
  num blackTrails;
  num gondolaSkilift;
  num armchairSkilift;
  num travelatorsSkilift;
  num bugelnySkilift;
  List<Skipass> skipasses;
  String name;
  String region;
  String beginSeason;
  String endSeason;
  num freeride;
  num snowpark;
  num eveningSkiing;
  num school;
  num indTraining;
  num childrenSchool;
  num equipRental;
  num distanceAirport;
  num distanceRailway;
  String info;
  String image;
  String listMonth;
  String linkOfsite;
  String mainResortImg;
  num maxHeight;

  ResortById({
    required this.idResort,
    required this.trailLength,
    required this.trailNumber,
    required this.skipass,
    required this.heightDifference,
    required this.greenTrails,
    required this.blueTrails,
    required this.redTrails,
    required this.blackTrails,
    required this.gondolaSkilift,
    required this.armchairSkilift,
    required this.travelatorsSkilift,
    required this.bugelnySkilift,
    required this.skipasses,
    required this.name,
    required this.region,
    required this.beginSeason,
    required this.endSeason,
    required this.freeride,
    required this.snowpark,
    required this.eveningSkiing,
    required this.school,
    required this.indTraining,
    required this.childrenSchool,
    required this.equipRental,
    required this.distanceAirport,
    required this.distanceRailway,
    required this.info,
    required this.image,
    required this.listMonth,
    required this.linkOfsite,
    required this.mainResortImg,
    required this.maxHeight,
  });

  factory ResortById.fromJson(Map<String, dynamic> json) =>
      ResortById.fromMap(json);

  String toJson() => json.encode(toMap());

  factory ResortById.fromMap(Map<String, dynamic> json) => ResortById(
        idResort: json["id_resort"],
        trailLength: json["trail_length"],
        trailNumber: json["trail_number"],
        skipass: json["skipass"],
        heightDifference: json["height_difference"],
        greenTrails: json["green_trails"],
        blueTrails: json["blue_trails"],
        redTrails: json["red_trails"],
        blackTrails: json["black_trails"],
        gondolaSkilift: json["gondola_skilift"],
        armchairSkilift: json["armchair_skilift"],
        travelatorsSkilift: json["travelators_skilift"],
        bugelnySkilift: json["bugelny_skilift"],
        skipasses: List<Skipass>.from(
            json["skipasses"].map((x) => Skipass.fromMap(x))),
        name: json["name"],
        region: json["region"],
        beginSeason: json["begin_season"],
        endSeason: json["end_season"],
        freeride: json["freeride"],
        snowpark: json["snowpark"],
        eveningSkiing: json["evening_skiing"],
        school: json["school"],
        indTraining: json["ind_training"],
        childrenSchool: json["children_school"],
        equipRental: json["equip_rental"],
        distanceAirport: json["distance_airport"],
        distanceRailway: json["distance_railway"],
        info: json["info"],
        image: json["image"],
        listMonth: json["list_month"],
        linkOfsite: json["link_ofsite"],
        mainResortImg: json["main_resort_img"],
        maxHeight: json["max_height"],
      );

  Map<String, dynamic> toMap() => {
        "id_resort": idResort,
        "trail_length": trailLength,
        "trail_number": trailNumber,
        "skipass": skipass,
        "height_difference": heightDifference,
        "green_trails": greenTrails,
        "blue_trails": blueTrails,
        "red_trails": redTrails,
        "black_trails": blackTrails,
        "gondola_skilift": gondolaSkilift,
        "armchair_skilift": armchairSkilift,
        "travelators_skilift": travelatorsSkilift,
        "bugelny_skilift": bugelnySkilift,
        "skipasses": List<dynamic>.from(skipasses.map((x) => x.toMap())),
        "name": name,
        "region": region,
        "begin_season": beginSeason,
        "end_season": endSeason,
        "freeride": freeride,
        "snowpark": snowpark,
        "evening_skiing": eveningSkiing,
        "school": school,
        "ind_training": indTraining,
        "children_school": childrenSchool,
        "equip_rental": equipRental,
        "distance_airport": distanceAirport,
        "distance_railway": distanceRailway,
        "info": info,
        "image": image,
        "list_month": listMonth,
        "link_ofsite": linkOfsite,
        "main_resort_img": mainResortImg,
        "max_height": maxHeight,
      };
}

class Skipass {
  String mobType;
  String price;

  Skipass({
    required this.mobType,
    required this.price,
  });

  factory Skipass.fromJson(String str) => Skipass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Skipass.fromMap(Map<String, dynamic> json) => Skipass(
        mobType: json["mob_type"],
        price: json["price"],
      );

  Map<String, dynamic> toMap() => {
        "mob_type": mobType,
        "price": price,
      };
}
