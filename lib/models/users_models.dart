class UsersModels {
  final int id;
  final String name;
  final String userName;
  final String email;

  UsersModels({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
  });

  factory UsersModels.fromJson(Map<String, dynamic> json) {
    return UsersModels(
      id: json['id'],
      name: json['name'],
      userName: json['username'],
      email: json['email'],
    );
  }
}
