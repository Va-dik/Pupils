import 'package:flutter/material.dart';
import 'package:pupils/students_list.dart';
import 'dart:math';

class AddStudent extends StatefulWidget {
  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        child: ListView(children: [
          ListTile(
            leading: Text("Фамилия"),
          ),
          ListTile(
            leading: Text("Имя"),
          )
        ]));
  }
}

//  Сhoice of the group
class SelectGroup extends StatefulWidget {
  @override
  _SelectGroupState createState() => _SelectGroupState();
}

class _SelectGroupState extends State<SelectGroup> {
  static List<String> studentsList = Constants.firstGroupList;

  static int _value = 1;

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

  //  Gradient box
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
          alignment: const Alignment(0, -0.9),
          child: const Text(
            'Выберите группу',
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 23, color: Colors.black),
          )),
      Align(
        alignment: const Alignment(0, -0.8),
        child: DropdownButton(
          dropdownColor: Colors.blue,
          value: _value,
          items: [
            const DropdownMenuItem(
              child: const Text(
                'ПОИТ-1',
                style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              value: 1,
            ),
            const DropdownMenuItem(
              child: const Text('ПОИТ-2',
                  style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              value: 2,
            )
          ],
          onChanged: _onChanged,
        ),
      ),
    ]);
  }
}

//  Students list
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
  int numStudents = 0;

  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    controller.repeat(reverse: true);
    super.initState();
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
      barrierDismissible: false,
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
                          color: Colors.white70,
                          fontSize: 23,
                          fontWeight: FontWeight.w900),
                    )),
                Align(
                  alignment: Alignment(0, 0.2),
                  child: FadeTransition(
                      opacity: controller,
                      child: MaterialButton(
                        height: 50,
                        color: Color(0xFF45FF20),
                        onPressed: () => setState(() {
                          _randomizer();
                        }),
                        child: Text(
                          'Сгенерировать',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w900,
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
