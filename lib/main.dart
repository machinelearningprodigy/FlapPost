import 'package:blogging_app/core/secrets/app_secrets.dart';
import 'package:blogging_app/core/theme/app_theme.dart';
import 'package:blogging_app/features/auth/presentation/pages/login_page.dart';
// import 'package:blogging_app/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //always use this on top whenever using 'await'
  final supabase = await Supabase.initialize(
    url:AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAPI,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}

