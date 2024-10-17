import 'dart:convert';
import 'package:http/http.dart' as http;

class ResetPasswordService {
  Future<Map<String, dynamic>?> resetPassword(String username, String code,
      String newPassword, String confirmPassword) async {
    const String url = 'https://api.mazaddimashq.com/api/auth/resetPassword';

    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "username": username,
        "code": code,
        "password": newPassword,
        "password_confirmation": confirmPassword,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Error: ${response.statusCode}');
      return null;
    }
  }
}
