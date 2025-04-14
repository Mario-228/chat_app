import 'package:customer_service_realtime_chat/core/util/app_fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.type,
    required this.labelText,
    required this.controller,
    required this.validator,
    this.icon,
    this.onPressed,
    this.isPassword = false,
    this.isEnabled = true,
  });
  final TextInputType type;
  final String labelText;
  final TextEditingController controller;
  final String validator;
  final IconData? icon;
  final void Function()? onPressed;
  final bool isPassword;
  final bool isEnabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      obscureText: isPassword,
      keyboardType: type,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        labelText: labelText,
        labelStyle: AppFonts.textStyleRegular16,
        suffixIcon: IconButton(onPressed: onPressed, icon: Icon(icon)),
      ),
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validator;
        }
        return null;
      },
    );
  }
}
