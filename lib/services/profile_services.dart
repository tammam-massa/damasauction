// services/api_profile_service.dart
import 'dart:convert';
import 'package:damasauction/models/profile/profile_model.dart';
import 'package:http/http.dart' as http;

class ApiProfileService {
  // The profile API endpoint
  static const String apiUrl = "https://api.mazaddimashq.com/api/auth/profile";

  // Function to fetch profile data using the token
  static Future<ProfileModel?> fetchUserProfile(String token) async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['success'] == true) {
          final profileData = jsonData['data']['user'];
          return ProfileModel.fromJson(profileData);
        }
      } else {
        print("Failed to fetch profile data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching profile data: $e");
    }
    return null;
  }
}
