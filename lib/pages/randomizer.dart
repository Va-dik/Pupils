import 'package:flutter/material.dart';
import 'package:pupils/pages/group_selection.dart';
import 'package:pupils/students_name_list.dart';
import 'package:pupils/widgets/card.dart';
import 'dart:math';

class Randomizer extends StatefulWidget {
  const Randomizer({Key? key}) : super(key: key);

  @override
  State<Randomizer> createState() => _RandomizerState();
}

class _RandomizerState extends State<Randomizer>
    with SingleTickerProviderStateMixin {
  int numStudents = 0;

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void saveRating() async {}

  void _randomizer() {
    List<String> studentsList = [];

    numStudents =
        Random().nextInt(Constants.groupList[GroupSelection.value].length);
    studentsList = Constants.groupList[GroupSelection.value];

    saveRating();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Stack(
          children: [
            Container(
              width: 350,
              alignment: const Alignment(0, 0),
              child: Widgets.ourList(studentsList, numStudents),
            ),
            Container(
              alignment: const Alignment(0, 0.25),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(120, 40),
                  ),
                ),
                child: const Text(
                  'Ок',
                  style: TextStyle(color: Colors.yellow, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB5FFD1),
      body: Align(
        alignment: const Alignment(0, -0.05),
        child: Container(
          width: MediaQuery.of(context).size.width/ 1.4,
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
            color: Colors.orangeAccent[400],
            borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Сгенерируйте студента',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 23,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 20.0),
              FadeTransition(
                  opacity: controller,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(width: 1)),
                    height: 50,
                    color: const Color(0xFF45FF20),
                    onPressed: () => setState(() {
                      _randomizer();
                    }),
                    child: const Text(
                      'Сгенерировать',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
