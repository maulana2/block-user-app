class PostUserModel {
  final String name;
  final String email;
  final String address;
  final String phoneNumber;
  final String city;

  PostUserModel({
    required this.name,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.city,
  });

  factory PostUserModel.fromJson(Map<String, dynamic> json) {
    return PostUserModel(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'email': email,
      'phoneNumber': phoneNumber,
      'city': city,
    };
  }
}
