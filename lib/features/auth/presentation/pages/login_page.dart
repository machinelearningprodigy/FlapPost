import 'package:blogging_app/core/theme/app_colors.dart';
import 'package:blogging_app/features/auth/presentation/pages/auth_signup_button.dart';
import 'package:blogging_app/features/auth/presentation/pages/signup_page.dart';
import 'package:blogging_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        key : formKey,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sign In', 
                style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
               AuthField(hintText: 'Email', controller: emailController,),
            const SizedBox(height: 15),
               AuthField(hintText: 'Password', controller: passwordController, isObscureText: true,),
            const SizedBox(height: 20),
              const AuthSignupButton(buttonText: 'Sign In',),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                    ),
                  );
              },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: ' Sign Up',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppPallete.gradient2,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}