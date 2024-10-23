import 'package:flutter/material.dart';
import 'package:petcareapp/auth/presentaion/screens/login_screen.dart';
import 'package:petcareapp/auth/presentaion/screens/signup_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routename = "register";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4552CB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "To",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              Text(
                " Pet Care",
                style: TextStyle(
                    color: Color(0xffFFCF6F),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Container(
            height: 60,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.facebook_rounded, color: Color(0xff4552CB)),
                SizedBox(width: 10),
                Text(
                  "Continue with Facebook",
                  style: TextStyle(color: Color(0xff4552CB)),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 60,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.gps_off_outlined, color: Color(0xff4552CB)),
                SizedBox(width: 10),
                Text(
                  "Continue with Google",
                  style: TextStyle(color: Color(0xff4552CB)),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.routename);
            },
            child: const Text(
              "Register with Email",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            style: TextButton.styleFrom(
              side: const BorderSide(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 100),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SignupScreen.routename);
            },
            child: const Text(
              "Already have an account? Sign In",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
