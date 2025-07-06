/*
 * Title: App Button
 * Description: Custom button widget
 * Author: Md. Tanvir Arif Siddiqui
 * Date: 7/5/2025
 * Time: 10:58 PM
 */

import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        )
      ),
        child: Text(label),
    );
  }
}
