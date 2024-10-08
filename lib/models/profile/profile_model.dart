// models/profile_model.dart
class ProfileModel {
  final int clientId;
  final String name;
  final String username;
  final String email;
  final String? phone;
  final String? address;
  final String? photo;

  ProfileModel({
    required this.clientId,
    required this.name,
    required this.username,
    required this.email,
    this.phone,
    this.address,
    this.photo,
  });

  // Factory method to create a ProfileModel from JSON data
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      clientId: json['client_id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      photo: json['photo'],
    );
  }
}
