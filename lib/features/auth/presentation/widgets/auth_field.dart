import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;

  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText, // Assigning the value here
        border: OutlineInputBorder(), // Optional: Adds a border
      ),
      validator: (value){
        if(value!.isEmpty){
          return "$hintText are you being missing!";
        }
        return null;
      },
      obscureText: isObscureText,
    );
  }
}
