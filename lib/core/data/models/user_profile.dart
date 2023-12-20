class UserProfile {
  int id;
  String email;
  String firstName;
  String lastName;
  dynamic avatar;
  String nickname;
  String city;
  String country;

  UserProfile({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.nickname,
    required this.city,
    required this.country,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
        nickname: json["nickname"],
        city: json["city"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
        "nickname": nickname,
        "city": city,
        "country": country,
      };
}
