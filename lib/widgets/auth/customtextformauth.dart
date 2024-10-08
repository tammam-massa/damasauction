import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData; // Prefix icon
  final TextEditingController myController;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool obscureText;
  final Color? color;
  final void Function()? onTapIcon; // Function for suffix icon
  final Function()? onTap;
  final bool readOnly;

  const CustomTextFormAuth({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    required this.myController,
    required this.valid,
    required this.isNumber,
    this.onTapIcon,
    this.color,
    this.onTap,
    this.obscureText = false,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 20),
      child: TextFormField(
        onTap: onTap,
        obscureText: obscureText,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: myController,
        readOnly: readOnly,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),

          // Prefix icon (remains as is)
          prefixIcon: Icon(
            iconData, // Your regular icon (e.g., Icons.lock for password)
            color: color ?? Colors.grey,
          ),

          // Suffix icon (visibility toggle or password generator)
          suffixIcon: onTapIcon != null
              ? InkWell(
                  onTap: onTapIcon, // Action for suffix icon
                  child: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: color ?? Colors.grey,
                  ),
                )
              : null, // If no onTapIcon, no suffix icon

          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(labelText),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
