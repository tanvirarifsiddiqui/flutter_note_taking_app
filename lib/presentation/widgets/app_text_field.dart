/*
 * Title: App Text Field
 * Description: Custom-styled text input
 * Author: Md. Tanvir Arif Siddiqui
 * Date: 7/5/2025
 * Time: 10:51 PM
 */

import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const AppTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
      ),
    );
  }
}
