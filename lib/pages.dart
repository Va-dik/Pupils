import 'dart:ui';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class Students extends StatelessWidget {
  final List<String> _studentsList = [
    'Ахремчик Вадим Дмитриевич',
    'Бесман Ярослав Евгеньевич',
    'Беспалов Максим Васильевич',
    'Буренков Кирилл Витальевич',
    'Войтик Никита Александрович',
    'Горовцов Степан Петрович',
    'Дащинский Егор Андреевич',
    'Заяц Александр Иванович',
    'Клаповщук Илья Андреевич',
    'Клещиков Антон Сергеевич',
    'Крючков Тимур Андреевич',
    'Ловицкая Анастасия Игоревна',
    'Марышев Денис Дмитриевич',
    'Молокова Виктория Геннадьевна',
    'Мостовой Артём Витальевич',
    'Оборин Даниил Алексеевич',
    'Полубинский Кирилл Леонидович'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _studentsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Color(0xFFF0FADA),
            child: ListTile(
              leading: Text(
                (index + 1).toString(),
                style: TextStyle(fontSize: 25),
                textScaleFactor: 2,
              ),
              title: Text(
                _studentsList[index],
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: TextField(
                decoration: InputDecoration(
                  hintText: 'Отметки',
                  hintStyle: TextStyle(color: Colors.red),
                ),
              ),
              shape: Border(
                bottom: BorderSide(width: 3, color: Colors.purple),
                top: BorderSide(width: 3, color: Colors.purple),
                left: BorderSide(width: 3, color: Colors.purple),
                right: BorderSide(width: 3, color: Colors.purple),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Randomizer extends StatefulWidget {
  @override
  _RandomizerState createState() => _RandomizerState();
}

class _RandomizerState extends State<Randomizer>
    with SingleTickerProviderStateMixin {
  List<Color> _colors = List<Color>.generate(
      8, (index) => index.isOdd ? Colors.deepOrange : Colors.yellow);
  List<double> _stops = List<double>.generate(8, (index) => index * 0.2 - 0.4);

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    animation = Tween<double>(begin: .0, end: .4).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
          controller.forward();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
        child: Container(
          height: 200,
          width: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
          gradient: LinearGradient(
        colors: _colors,
        stops: _stops.map((s) => s + animation.value).toList(),
      )),
      child: TextButton(onPressed: (){},
      child: Text('Сгенерировать'),),
    ));
  }
}
