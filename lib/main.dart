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
  Color? _bgColor = Colors.red[200];
  List<Widget> _pageList = [FirstPage(), SecondPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F0DA),
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
        selectedIconTheme: IconThemeData(color: Colors.blue, size: 35, opacity: 100),
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
                Icons.person,
                color: Colors.green,
              ),
              label: 'Рандомайзер'),
        ],
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;

      if (_currentIndex == 0) {
        _bgColor = Colors.red[200];
      }
      else if (_currentIndex == 1) {
        _bgColor = Colors.green[200];
      }
    });
  }
}
