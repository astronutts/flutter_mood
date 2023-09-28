import 'package:flutter/material.dart';
import 'package:flutter_mood/screens/post_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  static String routeName = "main";
  static String routeURL = "/";

  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  static List<Widget> pages = [const HomeScreen(), const PostScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(236, 231, 194, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(236, 231, 194, 1),
        title: const Text(
          '\u{1F525} MOOD \u{1F525}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
          color: Colors.black,
        ))),
        child: BottomNavigationBar(
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            iconSize: 22,
            selectedItemColor: Colors.black,
            elevation: 1,
            backgroundColor: const Color.fromRGBO(236, 231, 194, 1),
            currentIndex: _selectedIndex,
            items: const [
              BottomNavigationBarItem(
                label: "",
                icon: FaIcon(
                  FontAwesomeIcons.house,
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: FaIcon(
                  FontAwesomeIcons.pen,
                ),
              ),
            ]),
      ),
    );
  }
}
