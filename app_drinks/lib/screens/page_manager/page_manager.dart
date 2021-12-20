import 'package:app_drinks/constants.dart';
import 'package:app_drinks/screens/bookmarks/bookmarks.dart';
import 'package:app_drinks/screens/home/home.dart';
import 'package:flutter/material.dart';

class PageManager extends StatefulWidget {
  const PageManager({Key? key}) : super(key: key);

  @override
  _PageManagerState createState() => _PageManagerState();
}

class _PageManagerState extends State<PageManager> {
  int currentIndex = 0;
  final screens = [const DashBoard(),
    const BookMarks(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          backgroundColor: kPrimaryColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              label: 'BookMark',
            ),
          ]),
    );
  }
}
