class User {
  final String name;
  final String email;
  final String avatar;

  User({required this.name, required this.email, required this.avatar});

  // A factory method to parse JSON response into a User object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }
}
