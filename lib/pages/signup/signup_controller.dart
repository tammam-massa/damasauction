import 'package:damasauction/pages/signup/signup_services.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var name = '';
  var password = '';
  var email = '';
  var mobilenom = '';
  var description = '';
  var confirmpassword = '';
  var loadingsignup = false.obs;

  var registerStatus = false;

  RegisterService service = RegisterService();

  Future<void> RegisterOnClick() async {
    loadingsignup(true);
    registerStatus = await service.register(name, email, mobilenom, description,
        password, confirmpassword); // returns t or f
    loadingsignup(false);
  }
}
