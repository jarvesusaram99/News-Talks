import 'package:flutter/material.dart';
import 'package:flutter_news/view/screens/home_page.dart';
import 'package:flutter_news/view/utility/size_data.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'bookmark_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _screens = [
    HomePage(),
    BookmarkPage(),
  ];

  int _selectedIndex = 0;
  void _onPagedChanged(int index) {
    _selectedIndex = index;
  }

  void _onItemTapped(int selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex;
      _onPagedChanged(selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff8f5f1),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: myColor,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.bookmark),
              title: const Text("Bookmark"),
              selectedColor: myColor,
            ),
          ],
        ),
        body: _screens[_selectedIndex]);
  }
}
