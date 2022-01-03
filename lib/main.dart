import 'package:flutter/material.dart';
import 'package:pupils/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  Color _bgColor = Color(0xFFCCA4FF);
  Color _bottomNavColor = Color(0xFFB5FFD1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _bottomNavColor,
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        title: const Text(
          'Students Generator',
          style: const TextStyle(
              color: Colors.red, fontSize: 25, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      body: IndexedStack(
          index: _currentIndex,
          children: [AddStudent(), SelectGroup(), Students(), Randomizer()]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _bgColor,
        selectedIconTheme: const IconThemeData(size: 35),
        selectedItemColor: Colors.blue,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedFontSize: 14,
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.group_add,
                color: const Color(0xFFFFA86E),
              ),
              backgroundColor: const Color(0xFFFFD86C),
              label: "Добавить студента"),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: const Color(0xFFAC6CFF),
              ),
              backgroundColor: const Color(0xFFD0AEFC),
              label: 'Группа'),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.group,
                color: const Color(0xFF00AEBB),
              ),
              backgroundColor: const Color(0xE06DE9FA),
              label: 'Учащиеся'),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.shuffle,
                color: const Color(0xFF008B23),
              ),
              backgroundColor: const Color(0xE079FFA1),
              label: 'Рандомайзер'),
        ],
      ),
    );
  }

  void _onTabTapped(index) {
    setState(() {
      _currentIndex = index;

      switch (_currentIndex) {
        case 0:
          _bottomNavColor = Color(0xFFFFEFC2);
          break;

        case 1:
          _bottomNavColor = Color(0xFFC2D7FF);
          break;

        case 2:
          _bottomNavColor = Color(0xFFB4FCFF);
          break;

        case 3:
          _bottomNavColor = Color(0xFFB5FFD1);
          break;
      }
    });
  }
}
