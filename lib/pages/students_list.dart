import 'package:flutter/material.dart';
import 'package:pupils/pages/group_selection.dart';
import 'package:pupils/widgets/card.dart';

class StudentsList extends StatefulWidget {
  const StudentsList({Key? key}) : super(key: key);
  @override
  State<StudentsList> createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFC2D7FF),
      child: Column(
        children: [
          GroupSelection(setState: setState,),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: GroupSelection.studentsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Widgets.ourList(GroupSelection.studentsList, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}