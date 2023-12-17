class UserAuth {
  final String? token;
  final int? id;

  UserAuth({required this.token, required this.id});

  UserAuth.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        token = res['token'];

  Map<String, Object?> toMap() {
    return {'id': id, 'token': token};
  }
}
