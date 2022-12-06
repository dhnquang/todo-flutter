import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todoapp/app/screens/onboarding/onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(milliseconds: 2000);
    return Timer(duration, onboardingRoute);
  }

  onboardingRoute() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => const OnboardingScreen()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('lib/app/assets/images/splash.png'),
            const Padding(
              padding: EdgeInsets.only(top: 35),
              child: Text(
                'UpTodo',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Lato-Bold',
                  color: Colors.white,
                ),
              )
            )
          ],
        )
      )
    );
  }
}
