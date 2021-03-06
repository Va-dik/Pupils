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
        title: Text(
          'Students Generator',
          style: TextStyle(
              color: Colors.red, fontSize: 25, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      body: IndexedStack(
          index: _currentIndex,
          children: [SelectGroup(), Students(), Randomizer()]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _bgColor,
        selectedIconTheme: IconThemeData(size: 35),
        selectedItemColor: Colors.blue,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedFontSize: 14,
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Color(0xFFAC6CFF),
              ),
              label: 'Группа'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.group,
                color: Colors.red,
              ),
              label: 'Учащиеся'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shuffle,
                color: Color(0xFF008B23),
              ),
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
          _bgColor = Color(0xFFCCA4FF);
          _bottomNavColor = Color(0xFFB5FFD1);
          break;

        case 1:
          _bgColor = Color(0xE0FF8E8E);
          _bottomNavColor = Color(0xFFFFEFC2);
          break;

        case 2:
          _bgColor = Color(0xE079FFA1);
          _bottomNavColor = Color(0xFFC2D7FF);
          break;
      }
    });
  }
}
