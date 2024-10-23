import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{

  bool isNameValid = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;



  TextEditingController namecont=TextEditingController();
  TextEditingController emailcont =TextEditingController();
  TextEditingController passwordcont =TextEditingController();
}