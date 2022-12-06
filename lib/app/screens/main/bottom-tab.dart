import 'package:flutter/material.dart';
import 'package:todoapp/app/screens/main/calendar.dart';
import 'package:todoapp/app/screens/main/create-todo.dart';
import 'package:todoapp/app/screens/main/home.dart';
import 'package:todoapp/app/screens/main/profile.dart';

class BottomTabScreen extends StatefulWidget {
  const BottomTabScreen({Key? key}) : super(key: key);

  @override
  State<BottomTabScreen> createState() => _BottomTabScreenState();
}

Map<String, Widget> screens = {
  '0': const HomeScreen(),
  '1': const CalendarScreen(),
  '3': const CreateToDo(),
  '4': const ProfileScreen(),
};

class _BottomTabScreenState extends State<BottomTabScreen> {
  int _idxSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff8687E7),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xff363636),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Index',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calender',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 100,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: 'Focuses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _idxSelected,
          onTap: (int index) {
            if (index != 2) {
              setState(() {
                _idxSelected = index;
              });
            }
          },
          selectedItemColor: const Color(0xff8687E7),
          unselectedItemColor: const Color.fromRGBO(255, 255, 255, 0.87),
          selectedLabelStyle: const TextStyle(
            fontFamily: 'Lato-Regular',
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Lato-Regular',
            fontSize: 12,
          ),
        ),
      ),
      body: screens['$_idxSelected']
    );
  }
}


