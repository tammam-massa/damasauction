import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecaptchaWebView extends StatefulWidget {
  final String username; // Pass the username to the widget
  final String password; // Pass the password to the widget

  RecaptchaWebView({required this.username, required this.password});

  @override
  _RecaptchaWebViewState createState() => _RecaptchaWebViewState();
}

class _RecaptchaWebViewState extends State<RecaptchaWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the webview
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(
          'https://www.google.com/recaptcha/api2/demo?hl=en&render=explicit&sitekey=YOUR_SITE_KEY'));

    // Set up the JavaScript channel for communication
    _controller.addJavaScriptChannel(
      'MessageHandler',
      onMessageReceived: (message) {
        // message is now a string
        if (message.message.startsWith('recaptchaSolved:')) {
          // Extract token from message
          String token = message.message.split(':')[1];
          sendTokenToApi(token); // Send the token to your API
          Navigator.pop(context); // Optionally navigate back
        } else if (message.message == 'recaptchaError') {
          Navigator.pop(context); // Optionally navigate back
          // Handle error
          print('reCAPTCHA Error');
        }
      },
    );
  }

  // Function to send the reCAPTCHA token to your API
  Future<void> sendTokenToApi(String token) async {
    final url = 'https://api.mazaddimashq.com/api/auth/login'; // Your API URL
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username': widget.username, // Pass username
        'password': widget.password, // Pass password
        'captchaToken': token, // Pass reCAPTCHA token
      }),
    );

    if (response.statusCode == 200) {
      // Handle successful login
      final responseData = jsonDecode(response.body);
      if (responseData['success']) {
        // Login successful, handle data
        print('Login successful: ${responseData['message']}');
      } else {
        // Handle login failure
        print('Login failed: ${responseData['message']}');
      }
    } else {
      // Handle server error
      print('Server error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify reCAPTCHA')),
      body: WebViewWidget(controller: _controller),
    );
  }
}
