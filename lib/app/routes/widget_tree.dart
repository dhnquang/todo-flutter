import 'package:flutter/material.dart';
import 'package:todoapp/app/screens/authentication/login.dart';
import 'package:todoapp/app/screens/main/bottom-tab.dart';
import 'package:todoapp/app/screens/splash/splash.dart';
import 'package:todoapp/app/service/firebase_auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuthMethods().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const BottomTabScreen();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center (
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Something went wrong',
              style: TextStyle(
                fontFamily: 'Lato-Regular',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          );
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
