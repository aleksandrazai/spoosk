class UserProfile {
  int id;
  String email;
  String firstName;
  String lastName;
  DateTime dateJoined;
  dynamic avatar;

  UserProfile({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.dateJoined,
    required this.avatar,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        dateJoined: DateTime.parse(json["date_joined"]),
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "date_joined": dateJoined.toIso8601String(),
        "avatar": avatar,
      };
}
