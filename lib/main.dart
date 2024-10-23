import 'package:flutter/material.dart';
import 'package:petcareapp/auth/presentaion/manger/auth_provider.dart';
import 'package:petcareapp/get_started/presentation/screens/welcome_screen1.dart';
import 'package:petcareapp/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'auth/presentaion/screens/login_screen.dart';
import 'auth/presentaion/screens/register_screen.dart';
import 'auth/presentaion/screens/signup_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AuthProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        WelcomeScreen.routename:(_)=>WelcomeScreen(),
        LoginScreen.routename:(_)=>LoginScreen(),
        SignupScreen.routename:(_)=>SignupScreen(),
        RegisterScreen.routename:(_)=>RegisterScreen(),
      },
      home: SplashScreen(),
    );
  }
}

