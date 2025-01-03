class User
{
  int user_id;
  String name;
  String email;
  String phone;
  String password;

  User(
      this.user_id,
      this.name,
      this.email,
      this.phone,
      this.password,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    int.parse(json["user_id"]),
    json["name"],
    json["email"],
    json["phone"],
    json["password"],
  );


  Map<String, dynamic> toJson() =>
      {
        'user_id': user_id.toString(),
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      };
}