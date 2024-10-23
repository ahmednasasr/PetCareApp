import 'package:flutter/material.dart';
import 'package:petcareapp/auth/presentaion/screens/login_screen.dart';
import 'package:petcareapp/auth/presentaion/screens/register_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/custome_pageview.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routename="welcome";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              buildPage(
                image: 'assets/images/welcome1.png',
                title: 'Welcome to Pet Care',
                description: 'All types of services for your pet in one place, instantly searchable.',
              ),
              buildPage(
                image: 'assets/images/welcome2.png',
                title: 'Proven experts',
                description: 'We interview every specialist before they get to work.',
              ),
              buildPage(
                image: 'assets/images/welcome3.png',
                title: 'Reliable reviews',
                description: 'A review can be left only by a user who used the service.',
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.blue,
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 8,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.hasClients && _controller.page != null) {
                      if (_controller.page!.toInt() == 2) {
                        Navigator.pushNamed(context, RegisterScreen.routename);
                      } else {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    }
                  },
                  child: Text(
                    _controller.hasClients && _controller.page?.toInt() == 2 ? 'Get Started' : 'Next',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
