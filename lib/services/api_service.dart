import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://api.mazaddimashq.com/api';

  // Register user API
  Future<void> registerUser(Map<String, dynamic> userData) async {
    const url = '$baseUrl/auth/register';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userData),
    );

    if (response.statusCode == 200) {
      print('User registered successfully');
    } else {
      print('Error: ${response.body}'); // sign up error response from API
      throw Exception('Failed to register user');
    }
  }

  // Login user API

  Future<Map<String, dynamic>?> loginUser(
      String username, String password) async {
    const url = '$baseUrl/auth/login';
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return jsonResponse; // Return the parsed response
    } else {
      print('Login failed: ${response.statusCode}');
      print('Error response: ${response.body}');
      return null; // Return null for failure cases
    }
  }

  // Fetch authenticated user's data
  Future<Map<String, dynamic>> getUserData(String token) async {
    const url = '$baseUrl/auth/me';
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch user data');
    }
  }

  Future<Map<String, dynamic>> logoutUser() async {
    final response = await http.post(
      Uri.parse('${baseUrl}logout'),
      headers: {
        'Content-Type': 'application/json',
        // Add any necessary headers, such as Authorization if needed
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to logout');
    }
  }
}
