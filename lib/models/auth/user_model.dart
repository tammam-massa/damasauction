class UserModel {
  String name;
  String username;
  String email;
  String? phone; // This can be null, so we use nullable type
  int clientId;
  String password; // Password for registration
  String passwordConfirmation; // Password confirmation for registration

  UserModel({
    required this.name,
    required this.username,
    required this.email,
    this.phone,
    required this.clientId,
    required this.password,
    required this.passwordConfirmation,
  });

  // Factory constructor to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      clientId: json['client_id'],
      password: '', // Password not typically returned from the API
      passwordConfirmation: '', // Same here
    );
  }

  // Method to convert UserModel to JSON (if needed)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
      'client_id': clientId,
      'password': password, // Use only during registration
      'password_confirmation':
          passwordConfirmation, // Use only during registration
    };
  }
}
