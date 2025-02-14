import 'package:blogging_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AuthSignupButton extends StatelessWidget {
  
  final String buttonText;
  const AuthSignupButton({super.key, required this.buttonText,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppPallete.gradient1,
            AppPallete.gradient2,   
            AppPallete.gradient3,
          ],
        ),
        borderRadius: BorderRadius.circular(30), // Make rounded corners
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: AppPallete.transparentColor, // Make button background transparent
          shadowColor: Colors.transparent, // Remove elevation shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Match container shape
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.white, // Ensure text is visible
          ),
        ),
      ),
    );
  }
}
