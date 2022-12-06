import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              onTap: (){},
              child: CircleAvatar(

              ),
            ),
          )
        ],
      ),
      body: Text(
        'home',
        style: TextStyle(
          color: Colors.white
        ),
      )
    );
  }
}
