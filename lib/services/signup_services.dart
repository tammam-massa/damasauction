import 'dart:convert';

import 'package:damasauction/utils/Utiles.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  var msg;

  var url = Uri.parse('https://api.mazaddimashq.com/api/auth/register');

  Future<bool> register(String name, String username, String whatsapp,
      String password, String confirmpassword) async {
    // async and await for making any comand after wait till this ends

    print(name);
    print(password);
    print(username);

    print(whatsapp);
    print(confirmpassword);

    var response = await http.post(url, body: {
      'name': name,
      'username': username,
      'whatsapp': whatsapp,
      'password': password,
      'password_confirmation': confirmpassword,
    });
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var replay = jsonDecode(response.body);
      msg = replay['message'];
      showToast(text: msg, state: ToastStates.SUCCESS);

      return true;
    } else {
      var replay = jsonDecode(response.body);
      msg = replay['message'];
      showToast(text: msg, state: ToastStates.EROOR);
      return false;
    }
  }
}
