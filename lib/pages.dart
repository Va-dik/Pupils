import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class Constants {
  static const List<String> firstGroupList = [
    'Ахремчик Вадим ',
    'Бесман Ярослав ',
    'Беспалов Максим ',
    'Буренков Кирилл ',
    'Войтик Никита ',
    'Горовцов Степан ',
    'Дащинский Егор ',
    'Заяц Александр',
    'Клаповщук Илья',
    'Клещиков Антон',
    'Крючков Тимур',
    'Курилович Никита',
    'Ловицкая Анастасия ',
    'Марышев Денис',
    'Молокова Виктория ',
    'Мостовой Артём',
    'Оборин Даниил',
    'Полубинский Кирилл',
    'Сёмкин Кирилл',
  ];

  static const List<String> secondGroupList = [
    'Николаевич Ангелина',
    'Пашковский Артём',
    'Поцейко Никита',
    'Прокопышко Никита',
    'Сазановец Станислав',
    'Самулёв Степан',
    'Сарнавский Артём',
    'Свирко Анастасия',
    'Секацкая Диана',
    'Сидорович Даниил',
    'Старовойтов Максим',
    'Филипеня Денис',
    'Фурманов Михаил',
    'Шарахай Алексей',
    'Шкадун Павел',
    'Якимов Антон',
    'Якимцев Никита',
    'Ярмоленко Максим',
  ];

  static Map<int, String> fRating = {};
  static Map<int, String> sRating = {};
}

class SelectGroup extends StatefulWidget {
  @override
  _SelectGroupState createState() => _SelectGroupState();
}

class _SelectGroupState extends State<SelectGroup> {
  static List<String> studentsList = Constants.firstGroupList;

  static Object? _value = 1;

  void _onChanged(value) {
    setState(() {
      _value = value;

      if (_value == 1) {
        studentsList = Constants.firstGroupList;
      } else if (_value == 2) {
        studentsList = Constants.secondGroupList;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.red])),
      width: 300,
      height: 300,
      child: Stack(children: [
        Align(
          alignment: Alignment(0, -0.9),
          child: Text('Выберите группу', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23, color: Colors.white),)
          ),
        Align(
          alignment: Alignment.center,
          child: DropdownButton(
            dropdownColor: Colors.blue,
            value: _value,
            items: [
              DropdownMenuItem(
                child: Text(
                  'ПОИТ-1',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text('ПОИТ-2',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                value: 2,
              )
            ],
            onChanged: _onChanged,
          ),
        )
      ]),
    ));
  }
}

class Students extends StatefulWidget {
  @override
  _StudentsState createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _SelectGroupState.studentsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Widgets.ourList(_SelectGroupState.studentsList, index);
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
      8, (index) => index.isOdd ? Color(0xFFA953C4) : Color(0xFFD8D668));
  List<double> _stops = List<double>.generate(8, (index) => index * 0.2 - 0.4);
  int numStudents = 0;
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

  void saveRating() async {}

  void _randomizer() {
    List<String> studentsList = [];

    if (_SelectGroupState._value == 1) {
      numStudents = Random().nextInt(19);
      studentsList = Constants.firstGroupList;
    } else if (_SelectGroupState._value == 2) {
      numStudents = Random().nextInt(18);
      studentsList = Constants.secondGroupList;
    }

    saveRating();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        content: Stack(
          children: [
            Container(
                width: 300,
                alignment: const Alignment(0, -0.05),
                child: Widgets.ourList(studentsList, numStudents)),
            Container(
                alignment: const Alignment(0, 0.25),
                child: ElevatedButton(
                  child: const Text(
                    'Ок',
                    style: TextStyle(color: Colors.yellow, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                      fixedSize: MaterialStateProperty.all(Size(120, 40))),
                ))
          ],
        ),
        elevation: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment(0, -0.3),
          child: Container(
            width: 300,
            height: 350,
            color: Colors.orangeAccent[400],
            child: Stack(
              children: [
                Align(
                    alignment: Alignment(0, -0.9),
                    child: Text(
                      'Сгенерируйте студента',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w900),
                    )),
                Align(
                  alignment: Alignment(0, 0.2),
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          gradient: LinearGradient(
                            colors: _colors,
                            stops:
                                _stops.map((s) => s + animation.value).toList(),
                          )),
                      child: TextButton(
                        onPressed: () => setState(() {
                          _randomizer();
                        }),
                        child: Text(
                          'Сгенерировать',
                          style: TextStyle(
                              color: Color(0xFF66FF004),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Widgets {
  static Widget ourList(List studentsList, int index, [String? text]) {
    TextEditingController controller = TextEditingController();
    if (_SelectGroupState._value == 1) {
      if (Constants.fRating[index] != null)
        controller.text = Constants.fRating[index]!;
    } else if (_SelectGroupState._value == 2) {
      if (Constants.sRating[index] != null)
        controller.text = Constants.sRating[index]!;
    }
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
              onChanged: (value) {
                if (_SelectGroupState._value == 1) {
                  Constants.fRating[index] = controller.text;
                  print(Constants.fRating);
                } else {
                  Constants.sRating[index] = controller.text;
                  print(Constants.sRating);
                }
              },
              controller: controller,
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
