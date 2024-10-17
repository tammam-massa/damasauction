import 'dart:convert';

import 'package:damasauction/Utiles.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordService {
  static const String apiUrl =
      "https://api.mazaddimashq.com/api/auth/forgotPassword";

  // Function to make the API call
  Future<Map<String, dynamic>?> forgotPassword(String username) async {
    try {
      Map<String, String> requestBody = {
        "username": username,
        "client_type": "app",
      };

      // Make the POST request
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the response
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        if (responseBody['success'] == true) {
          return responseBody;
        } else {
          // Handle errors from the API response
          print('Error: ${responseBody['errors']}');
          return null;
        }
      } else {
        print(
            'Failed to communicate with the server. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('An error occurred: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> verifyCode(
      String username, String verificationCode) async {
    const String url =
        'https://api.mazaddimashq.com/api/auth/forgotPassword'; // Assuming this is the endpoint

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "username": username, // User's username (can be email or phone)
          "auth_code":
              verificationCode, // The verification code sent by the API
        }),
      );

      // Check if the status code is 200 (success)
      if (response.statusCode == 200) {
        var reply = jsonDecode(response.body);

        // Assuming there's a message and success field in the response
        String msg = reply['message'];
        bool success = reply['success'];

        // Show a success message (assuming showToast is a function in your project)
        showToast(text: msg, state: ToastStates.SUCCESS);

        // Return the reply for further processing
        return reply;
      } else {
        var reply = jsonDecode(response.body);
        String msg = reply['message'];

        // Show an error message
        showToast(text: msg, state: ToastStates.EROOR);

        return reply;
      }
    } catch (e) {
      // Handle any exceptions like network issues
      print('An error occurred: $e');
      showToast(text: 'An error occurred: $e', state: ToastStates.EROOR);
      return null;
    }
  }
}
