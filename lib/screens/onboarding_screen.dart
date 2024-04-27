import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guzo_go_clone/routes/custom_route.dart';
import 'package:guzo_go_clone/screens/root_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.push(context, customPageRoute(const RootScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 3, 5, 88).withOpacity(.8),
          ),
          Center(
            child: Image.asset(
              "assets/images/yellow-logo.png",
              height: 250,
            ),
          ),
        ],
      ),
    );
  }
}
