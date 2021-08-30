import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pupils/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xFFcdd0fa),
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
            brightness: Brightness.dark,
          ),
          body: HomePage()),
          routes: <String, WidgetBuilder>
          {
            '/a': (BuildContext context) => HomePage()
          }
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
  Color _color0 = Colors.red;
  Color _color1 = Colors.green;
  var list = [FirstPage(), SecondPage()];
  var colorList = [Colors.amber];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _bgColor,
        selectedIconTheme: IconThemeData(color: Colors.blue, size: 35),
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.group,
                color: _color0,
              ),
              label: 'Учащиеся'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _color1,
              ),
              label: 'Рандоамайзер'),
        ],
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;

      if (_currentIndex == 0) {
        _bgColor = Colors.red[200];
      } else if (_currentIndex == 1) {
        _bgColor = Colors.green[200];
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (BuildContext context) {
        //   return students();
        // }));
      }
    });
  }
}
