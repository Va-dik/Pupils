import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class Constants {
  static const List<String> studentsList = [
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
    'Курилович Никита Дмитриевич',
    'Ловицкая Анастасия Игоревна',
    'Марышев Денис Дмитриевич',
    'Молокова Виктория Геннадьевна',
    'Мостовой Артём Витальевич',
    'Оборин Даниил Алексеевич',
    'Полубинский Кирилл Леонидович',
    'Сёмкин Кирилл Дмитриевич'
  ];
}

class Students extends StatelessWidget {
  final List<String> studentsList = Constants.studentsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: studentsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Widgets.ourList(studentsList, index);
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
      8, (index) => index.isOdd ? Color(0xE0EC5EFF) : Color(0xE079FFA1));
  List<double> _stops = List<double>.generate(8, (index) => index * 0.2 - 0.4);
  final List<String> studentsList = Constants.studentsList;

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

  void _randomizer() {
    int value = Random().nextInt(19);

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: SingleChildScrollView(
          child: Container(
              alignment: Alignment.topCenter,
              child: Widgets.ourList(studentsList, value)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment(0, 0.5),
          child: Container(
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  gradient: LinearGradient(
                    colors: _colors,
                    stops: _stops.map((s) => s + animation.value).toList(),
                  )),
              child: TextButton(
                onPressed: () => setState(() {
                  _randomizer();
                }),
                child: Text(
                  'Сгенерировать',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )),
        ),
      ],
    );
  }
}

class Widgets {
  static Widget ourList(List studentsList, int index) {
    return Container(
        margin: EdgeInsets.all(8),
        child: ListTile(
          leading: Text(
            (index + 1).toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
            textScaleFactor: 2.4,
          ),
          title: Text(
            studentsList[index],
            style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          subtitle: TextField(
              decoration: InputDecoration(
                hintText: 'Отметки',
                hintStyle: TextStyle(color: Colors.red),
              ),
              keyboardType: TextInputType.phone),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFF0FADA),
          border: Border.all(width: 3, color: Colors.purple),
        ));
  }
}
