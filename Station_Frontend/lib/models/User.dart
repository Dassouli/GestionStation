class User {
  int id;
  String name;
  String email;
  String password;
  String roles;
  String message;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.roles,
    required this.message,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      roles: json['roles'] as String,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'roles': roles,
      'message': message,
    };
  }
}
