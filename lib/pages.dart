import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class Constants {
  static const List<String> firstGroupList = [
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

  static const List<String> secondGroupLiist = [
    'Николаевич Ангелина Ивановна',
    'Пашковский Артём Николаевич',
    'Поцейко Никита Андреевич',
    'Прокопышко Никита Кириллович',
    'Сазановец Станислав Игоревич',
    'Самулёв Степан Вячеславович',
    'Сарнавский Артём Геннадьевич',
    'Свирко Анастасия Сергеевна',
    'Секацкая Диана Игоревна',
    'Сидорович Даниил Андреевич',
    'Старовойтов Максим Игоревич',
    'Филипеня Денис Александрович',
    'Фурманов Михаил Дмитриевич',
    'Чертков Константин Валентинович',
    'Шарахай Алексей Олегович',
    'Якимов Антон Русланович',
    'Якимцев Никита Михайлович',
    'Ярмоленко Максим Андреевич',
  ];
}

class SelectGroup extends StatefulWidget {
  static List<String> studentsList = Constants.firstGroupList;
  @override
  _SelectGroupState createState() => _SelectGroupState();
}

class _SelectGroupState extends State<SelectGroup> {
  
  static Object? _value = 1;

  void _onChanged(value)
  {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 300,
        height: 300,
        color: Colors.orange,
        child: DropdownButton(value: _value,
        items: [DropdownMenuItem(child: Text('ПОИТ-1'),
        value: 1,),
        DropdownMenuItem(child: Text('ПОИТ-2'),
        value: 2,)],
        onChanged: _onChanged,
        )
      ),
    );
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
        itemCount: SelectGroup.studentsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Widgets.ourList(SelectGroup.studentsList, index);
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
    
    List<String> studentsList = [];

    int numStudents = 0;

    if(_SelectGroupState._value == 1)
    {
      numStudents = Random().nextInt(19);
      studentsList = Constants.firstGroupList;
    }
    else if(_SelectGroupState._value == 2)
    {
      numStudents = Random().nextInt(18);
      studentsList = Constants.secondGroupLiist;
    }

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: SingleChildScrollView(
          child: Container(
              alignment: Alignment.topCenter,
              child: Widgets.ourList(studentsList, numStudents)),
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