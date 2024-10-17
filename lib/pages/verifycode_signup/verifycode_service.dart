import 'dart:convert';
import 'package:damasauction/Utiles.dart';
import 'package:http/http.dart' as http;

class VerifyCodeService {
  var msg;

  // Updated method to check if username is email or phone
  verifyCode(String username, String verificationCode) async {
    const String url = 'https://api.mazaddimashq.com/api/auth/login';

    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "username": username, // This can be email or phone
        "auth_code": verificationCode,
      }),
    );

    if (response.statusCode == 200) {
      var reply = jsonDecode(response.body);
      msg = reply['message'];
      showToast(text: msg, state: ToastStates.SUCCESS);

      return reply; // Return the entire response for further processing
    } else {
      var reply = jsonDecode(response.body);
      msg = reply['message'];
      showToast(
          text: msg, state: ToastStates.EROOR); // Corrected spelling of "ERROR"
      return reply; // Return the entire response for further processing
    }
  }

  static const String url = 'https://api.mazaddimashq.com/api/auth/reSendEmail';
  resendData(String username) async {
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"username": username}), // This can be email or phone
    );

    if (response.statusCode == 200) {
      var reply = jsonDecode(response.body);
      msg = reply['message'];
      showToast(text: msg, state: ToastStates.SUCCESS);

      return true;
    } else {
      var reply = jsonDecode(response.body);
      msg = reply['message'];
      showToast(
          text: msg, state: ToastStates.EROOR); // Corrected spelling of "ERROR"
      return false;
    }
  }
}
