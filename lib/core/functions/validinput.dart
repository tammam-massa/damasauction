import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return "Not a valid Email";
    }
  }

  if (type == "phone") {
    RegExp myRegex = RegExp(r'^(93|998|982|996|987|997|99|995|94|95|96)');
    if (val.isEmpty) {
      return "Value Can not be Empty";
    } else if (val.length != 9) {
      return "Phone number Must be 9 digits";
    } else if (!myRegex.hasMatch(val)) {
      return "It is not a correct phone number";
    }
  }

  if (val.isEmpty) {
    return "Value Can not be Empty";
  }

  if (val.length < min) {
    return "Value Can not be less than $min";
  }
  if (val.length > max) {
    return "Value Cannot be Bigger Than $max";
  }

  // Password validation (if applicable)
  if (type == "password") {
    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[\W]).{8,}$');
    if (!passwordRegex.hasMatch(val)) {
      return "Password must be at least 8 characters long, include at least one uppercase letter, one number, and one special character";
    }
  }
}
