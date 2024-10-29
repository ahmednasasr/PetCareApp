import 'package:flutter/material.dart';
import 'package:petcareapp/auth/presentaion/manger/auth_provider.dart';
import 'package:petcareapp/get_started/presentation/screens/welcome_screen1.dart';
import 'package:petcareapp/main_layout/presentaion/manger/layout_provider.dart';
import 'package:petcareapp/main_layout/presentaion/screens/layouy_screen.dart';
import 'package:petcareapp/search/presentation/screens/doctor_Detail_Screen.dart';
import 'package:petcareapp/search/presentation/screens/search_results_screen.dart';
import 'package:petcareapp/search/presentation/screens/select_date_screen.dart';
import 'package:petcareapp/search/presentation/screens/select_specialty_screen.dart';
import 'package:petcareapp/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'auth/presentaion/screens/login_screen.dart';
import 'auth/presentaion/screens/register_screen.dart';
import 'auth/presentaion/screens/signup_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => LayoutProvider()),
      ],
      child: const MyApp()),
  );
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
        LayoutScreen.routename:(_)=>LayoutScreen(),
        SearchResultsScreen.routename:(_)=>SearchResultsScreen(),
        SelectDateScreen.routename:(_)=>SelectDateScreen(),
        SelectSpecialtyScreen.routename:(_)=>SelectSpecialtyScreen(),
        DoctorDetailScreen.routename:(_)=>DoctorDetailScreen(),

      },
      home: SplashScreen(),
    );
  }
}

