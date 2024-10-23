import 'package:flutter/material.dart';
import 'package:petcareapp/main_layout/presentaion/screens/Appointments_screen.dart';
import 'package:petcareapp/main_layout/presentaion/screens/explore_screen.dart';
import 'package:petcareapp/main_layout/presentaion/screens/profile_screen.dart';
import 'package:petcareapp/main_layout/presentaion/screens/search_screen.dart';

class LayoutProvider extends ChangeNotifier{
  int selectedIndex = 0;
  List<Widget> screens= [
    SearchScreen(),
    AppointmentsScreen(),
    ExploreScreen(),
    ProfileScreen(),
  ];

  void updateIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

}