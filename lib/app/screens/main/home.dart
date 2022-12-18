import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp/app/service/firebase_auth_methods.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User? user = FirebaseAuthMethods().currentUser;

  Future<void> signOut() async {
    await FirebaseAuthMethods().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
          title: const Text(
            'Index',
            style: TextStyle(
              fontFamily: 'Lato-Regular',
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: () {},
                child: CircleAvatar(),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Text(
              user?.email ?? 'User email',
              style: const TextStyle(
                fontFamily: 'Lato-Regular',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: signOut,
              child: const Text(
                'Sign Out',
                style: TextStyle(
                  fontFamily: 'Lato-Regular',
                  color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }
}
