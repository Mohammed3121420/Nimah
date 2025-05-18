// lib/widgets/custom_input_decoration.dart

import 'package:flutter/material.dart';

typedef ToggleObscureCallback = void Function();

InputDecoration buildInputDecoration({
  required String hint,
  bool isPassword = false,
  required bool obscureText,
  required ToggleObscureCallback onToggle,
}) {
  return InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: Color(0xFFFFF3E0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.orange[200]!),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.orange[200]!),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.orange[700]!, width: 2),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    suffixIcon:
        isPassword
            ? IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[700],
              ),
              onPressed: onToggle,
            )
            : null,
  );
}
