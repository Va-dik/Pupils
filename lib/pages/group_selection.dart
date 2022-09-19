import 'package:flutter/material.dart';
import 'package:pupils/students_name_list.dart';

class GroupSelection extends StatelessWidget {
  final void Function(void Function() fn) setState;
  const GroupSelection({Key? key, required this.setState}) : super(key: key);

  static List<String> studentsList = Constants.firstStudentsList;
  static int value = 0;

  void _onChanged(value) {
    setState(() {
      GroupSelection.value = value;
      GroupSelection.studentsList = Constants.groupList[GroupSelection.value];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xFFF0FADA),
          border: Border.all(width: 5),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'Выберите группу',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 23, color: Colors.black),
        ),
        DropdownButton(
          value: GroupSelection.value,
          dropdownColor: Colors.blue,
          items: List.generate(
              Constants.groupName.length,
              (index) => DropdownMenuItem(
                    value: index,
                    child: Text(
                      Constants.groupName[index],
                      style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
          onChanged: _onChanged,
        ),
      ]),
    );
  }
}
