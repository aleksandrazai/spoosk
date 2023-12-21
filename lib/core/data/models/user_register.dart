class UserRegister {
  int id;
  String firstName;
  String email;

  UserRegister({
    required this.id,
    required this.firstName,
    required this.email,
  });

  factory UserRegister.fromJson(Map<String, dynamic> json) => UserRegister(
        id: json["id"],
        firstName: json["first_name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "email": email,
      };
}
