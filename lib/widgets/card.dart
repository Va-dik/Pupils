import 'package:flutter/material.dart';
import 'package:pupils/pages/group_selection.dart';
import 'package:pupils/students_name_list.dart';

class Widgets {
  static Widget ourList(List studentsList, int index, [String? text]) {
    TextEditingController controller = TextEditingController();
    if (GroupSelection.value == 0) {
      if (Constants.fRating[index] != null)
        controller.text = Constants.fRating[index]!;
    } else if (GroupSelection.value == 1) {
      if (Constants.sRating[index] != null)
        controller.text = Constants.sRating[index]!;
    }
    return Container(
        margin: EdgeInsets.all(8),
        child: ListTile(
          // Num student
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
                // Move raiting in students list
                if (GroupSelection.value == 0) {
                  Constants.fRating[index] = controller.text;
                } else {
                  Constants.sRating[index] = controller.text;
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