import 'package:flutter/material.dart';

Widget students()
{
  return Scaffold(
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
  );
}