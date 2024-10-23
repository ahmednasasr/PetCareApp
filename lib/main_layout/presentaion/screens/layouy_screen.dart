import 'package:flutter/material.dart';
import 'package:petcareapp/main_layout/presentaion/manger/layout_provider.dart';
import 'package:provider/provider.dart';

class LayoutScreen extends StatefulWidget {
   static const String routename="Layout";
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Color(0xff4552CB),
              unselectedItemColor: Color(0xffBBC3CE),
              currentIndex: provider.selectedIndex,
              onTap: (value){
                provider.updateIndex(value);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.timer), label: "Appointments"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.explore), label: "Explore"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "profile"),
              ]),
          body: provider.screens[provider.selectedIndex],
        );
      },
    );
  }
}
