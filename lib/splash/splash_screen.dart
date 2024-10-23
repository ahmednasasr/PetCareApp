import 'package:flutter/material.dart';
import 'package:petcareapp/get_started/presentation/screens/welcome_screen1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushNamed(context, WelcomeScreen.routename);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Image(image: AssetImage("assets/images/splash.png"),fit: BoxFit.cover,),
    );
  }
}
