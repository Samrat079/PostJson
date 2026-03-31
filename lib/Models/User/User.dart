class User {
  final int id;
  final String username,
      email,
      firstName,
      lastName,
      image,
      birthDate,
      phone,
      password;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.birthDate,
    required this.phone,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['image'],
      birthDate: json['birthDate'],
      phone: json['phone'],
      password: json['password']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "image": image,
      "birthDate": birthDate,
      "phone": phone,
      'password': password
    };
  }
}
