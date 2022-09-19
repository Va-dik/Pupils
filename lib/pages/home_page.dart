import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pupils/pages/add_student.dart';
import 'package:pupils/pages/randomizer.dart';
import 'package:pupils/pages/students_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  Color _backgroundColor = const Color(0xFFFFEFC2);
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        title: const Text(
          'Students Generator',
          style: TextStyle(
              color: Colors.red, fontSize: 25, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const [
          AddStudent(),
          StudentsList(),
          Randomizer(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.group_add,
              color: _currentIndex == 0 ? _backgroundColor : Colors.black),
          Icon(Icons.group,
              color: _currentIndex == 1 ? _backgroundColor : Colors.black),
          Icon(Icons.shuffle,
              color: _currentIndex == 2 ? _backgroundColor : Colors.black),
        ],
        onTap: _onTabTapped,
        backgroundColor: _backgroundColor,
        color: const Color.fromARGB(255, 117, 210, 223),
        height: 60,
        index: _currentIndex,
      ),
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentIndex = page;

      switch (_currentIndex) {
        case 0:
          _backgroundColor = const Color(0xFFFFEFC2);
          break;

        case 1:
          _backgroundColor = const Color(0xFFC2D7FF);
          break;

        case 2:
          _backgroundColor = const Color(0xFFB5FFD1);
          break;
      }
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(seconds: 1), curve: Curves.ease);

      switch (_currentIndex) {
        case 0:
          _backgroundColor = const Color(0xFFFFEFC2);
          break;

        case 1:
          _backgroundColor = const Color(0xFFC2D7FF);
          break;

        case 2:
          _backgroundColor = const Color(0xFFB5FFD1);
          break;
      }
    });
  }
}
