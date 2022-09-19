import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);
  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {

  void addStudent() {
    //!!!!!! _SelectGroupState.studentsList.add(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFEFC2),
        padding: const EdgeInsets.all(10),
        child: Column(
        children: [
        const Text(
          'Фамилия:',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
        ),
        TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[а-яА-Яa-zA-Z]"))
            ],
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) return "Введите фамилию студента";
            }),
        const SizedBox(height: 20.0),
        const Text(
          'Имя:',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
        ),
        TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[а-яА-Яa-zA-Z]"))
            ],
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value!.isEmpty) return 'Введите имя студента';
            }),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Студент успешно добавлен.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                backgroundColor: Colors.blue,
              ));
          },
          child: const Text('Добавить'),
        ),
        ],
        ));
  }
}