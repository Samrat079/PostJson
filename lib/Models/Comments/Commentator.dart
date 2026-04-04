class Commentator {
  final int id;
  final String username, fullName;

  Commentator({
    required this.id,
    required this.username,
    required this.fullName,
  });

  factory Commentator.fromJson(Map<String, dynamic> json) {
    return Commentator(
      id: json['id'],
      username: json['username'],
      fullName: json['fullName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username, 'fullName': fullName};
  }
}
