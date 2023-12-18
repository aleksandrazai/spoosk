class UserLogin {
  int status;
  String message;
  UserData data;

  UserLogin({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        status: json["status"],
        message: json["message"],
        data: UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class UserData {
  int id;
  String token;

  UserData({
    required this.id,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        token: json["Token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Token": token,
      };

  UserData.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        token = res['token'];

  Map<String, Object?> toMap() {
    return {'id': id, 'token': token};
  }
}
