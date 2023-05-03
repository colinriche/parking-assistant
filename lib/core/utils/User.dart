class User {
  String id;
  String name;
  String email;
  double latitude;
  double longitude;

  User({required this.id, required this.name, required this.email, required this.latitude, required this.longitude});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'latitude': latitude,
    'longitude': longitude,
  };
}