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
  Color _appColor = Color(0xFFF8F0DA);
  Color _bgColor = Color(0xE0FF8E8E);
  List<Widget> _pageList = [Students(), Randomizer()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColor,
          appBar: AppBar(
            backgroundColor: Colors.amber[300],
            title: Text(
              'Students',
              style: TextStyle(
                  color: Colors.red, fontSize: 25, fontWeight: FontWeight.w900),
            ),
            centerTitle: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
      body: IndexedStack(index: _currentIndex, children: _pageList),
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
                Icons.group,
                color: Colors.red,
              ),
              label: 'Учащиеся'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.refresh,
                color: Colors.green,
              ),
              label: 'Рандомайзер'),
        ],
      ),
    );
  }

  void _onTabTapped(index) {
    setState(() {

      _currentIndex = index;

      if (_currentIndex == 0) {
        _bgColor = Color(0xE0FF8E8E);
        _appColor = Color(0xFFFFEFC2);
      }
      else if (_currentIndex == 1) {
        _bgColor = Color(0xE079FFA1);
        _appColor = Color(0xFFC2D7FF);
      }
    });
  }
}
