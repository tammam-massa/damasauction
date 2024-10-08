import 'package:damasauction/controllers/auth/auth_controller.dart';
import 'package:damasauction/core/class/handlingdataview.dart';
import 'package:damasauction/core/class/statusRequest.dart';
import 'package:damasauction/core/functions/validinput.dart';
import 'package:damasauction/views/auth/loginpage.dart';
import 'package:damasauction/widgets/auth/customtextformauth.dart';
import 'package:damasauction/widgets/shared/actionbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_code_picker/country_code_picker.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthController authController = Get.put(AuthController());

  // Global key for form validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailOrPhoneController = TextEditingController();
  final contactNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final descriptionController = TextEditingController();

  String selectedCountryCode = '+963'; // Default country code
  StatusRequest statusRequest = StatusRequest.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_outlined, color: Colors.black),
          onPressed: () {
            Get.back(); // Go back on button press
          },
        ),
        title: Center(
          child: Text(
            "sign_up".tr, // Translation added here
            style: const TextStyle(color: Color(0xff000000)),
          ),
        ),
      ),
      body: GetBuilder<AuthController>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: authController.formstate, // Wrap inputs in a Form widget
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "create_your_account".tr, // Translation added here
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Name Field
                    CustomTextFormAuth(
                      hintText:
                          'enter_your_full_name'.tr, // Translation added here
                      labelText: 'name'.tr, // Translation added here
                      iconData: Icons.person,
                      myController: nameController,
                      valid: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please_enter_your_name'
                              .tr; // Translation added here
                        }
                        return null; // Return null if valid
                      },
                      isNumber: false,
                      readOnly: false,
                    ),

                    const SizedBox(height: 10),

                    // Email or Phone Field
                    CustomTextFormAuth(
                      hintText: 'enter_your_email_or_phone_number'
                          .tr, // Translation added here
                      labelText: 'email_or_phone'.tr, // Translation added here
                      iconData: Icons.contact_mail,
                      myController: emailOrPhoneController,
                      valid: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please_enter_your_email_or_phone_number'
                              .tr; // Translation added here
                        }

                        // Email validation using a robust regex
                        RegExp emailRegex = RegExp(
                          r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
                        );

                        // Validate phone number format for Syrian numbers
                        RegExp phoneRegex = RegExp(
                          r'^\+963(93|998|982|996|987|997|99|995|94|95|96|955)\d{7}$',
                        );

                        // Check if the input matches email or phone number format
                        if (emailRegex.hasMatch(value)) {
                          return null; // Return null if valid email
                        } else if (phoneRegex.hasMatch(value)) {
                          return null; // Return null if valid phone number
                        }

                        // If neither format is valid, return error messages accordingly
                        if (!emailRegex.hasMatch(value)) {
                          return "it_is_not_a_correct_email"
                              .tr; // Translation added here
                        }

                        if (!phoneRegex.hasMatch(value)) {
                          return 'please_enter_a_valid_phone_number_starting_with_+963.'
                              .tr; // Translation added here
                        }

                        return null; // Return null if valid
                      },
                      isNumber: false,
                      readOnly: false,
                    ),

                    const SizedBox(height: 10),

                    // Contact Number with Country Code Picker
                    // Assuming you're using this inside your form
                    TextFormField(
                      controller: contactNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText:
                            'contact_number'.tr, // Translation added here
                        hintText: 'enter_your_contact_number'
                            .tr, // Translation added here
                        prefixIcon: CountryCodePicker(
                          onChanged: (countryCode) {
                            selectedCountryCode = countryCode.dialCode!;
                          },
                          initialSelection: 'SY',
                          favorite: const ['+963', 'SY'],
                          showFlag: true,
                          showDropDownButton: true,
                          padding: const EdgeInsets.all(0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Optional Description Field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '(optional)'.tr,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        CustomTextFormAuth(
                          hintText: 'enter_a_short_description'
                              .tr, // Translation added here
                          labelText: 'description'.tr, // Translation added here
                          iconData: Icons.description,
                          myController: descriptionController,
                          valid: (value) {
                            return null; // No validation needed
                          },
                          isNumber: false,
                          readOnly: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Password Field
                    CustomTextFormAuth(
                      hintText:
                          'enter_your_password'.tr, // Translation added here
                      labelText: 'password'.tr, // Translation added here
                      iconData: Icons.lock,
                      myController: passwordController,
                      valid: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please_enter_your_password'
                              .tr; // Translation added here
                        }

                        // Regex for password validation
                        RegExp regexpassword = RegExp(
                          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                        );
                        if (!regexpassword.hasMatch(value)) {
                          return 'password_must_be_at_least_8_characters_long,_include_one_uppercase_letter,_one_number,_and_one_special_character.'
                              .tr; // Translation added here
                        }
                        // Call the validInput function
                        String? validationMessage =
                            validInput(value, 8, 30, "password");
                        if (validationMessage != null) {
                          return validationMessage; // Return the validation message if it exists
                        }

                        return null;
                      },
                      isNumber: false,
                      obscureText: controller.isshowPassword,
                      readOnly: false,
                      onTapIcon: () {
                        controller
                            .showPassword(); // Toggles password visibility
                      },
                    ),

                    const SizedBox(height: 10),

                    // Confirm Password Field
                    CustomTextFormAuth(
                      hintText:
                          're-enter_your_password'.tr, // Translation added here
                      labelText:
                          'confirm_password'.tr, // Translation added here
                      iconData: Icons.lock,
                      myController: confirmPasswordController,
                      valid: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please_confirm_your_password'
                              .tr; // Translation added here
                        }
                        if (value != passwordController.text) {
                          return 'passwords_do_not_match'
                              .tr; // Translation added here
                        }
                        return null;
                      },
                      isNumber: false,
                      obscureText: controller.isshowConfirmPassword,
                      readOnly: false,
                      onTapIcon: () {
                        controller.showConfirmPassword();
                      },
                    ),

                    const SizedBox(height: 20),

                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child:
                          // Replace ElevatedButton.icon with ActionButton

                          ActionButton(
                        iconData: Icons.person_add,
                        text: "create_account".tr, // Button text
                        backgroundColor:
                            const Color(0xff358cde), // Button color
                        onPressed: () {
                          if (authController.formstate.currentState!
                              .validate()) {
                            // Trigger registration via AuthController
                            final input = emailOrPhoneController.text.trim();
                            String? email;
                            String? phone;

                            if (input.contains('@')) {
                              email = input;
                            } else {
                              phone = selectedCountryCode + input;
                            }

                            // Call the register method in AuthController
                            controller.register(
                              nameController.text,
                              emailOrPhoneController.text,
                              email, // Pass email or null
                              phone, // Pass phone or null
                              passwordController.text,
                              confirmPasswordController.text,
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Already have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "already_have_an_account?"
                              .tr, // Translation added here
                          style: const TextStyle(fontSize: 14),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.off(() => LoginPage());
                          },
                          child: Text(
                            "login".tr, // Translation added here
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff358cde),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
