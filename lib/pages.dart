import 'package:flutter/material.dart';

int q = 0;

class FirstPage extends StatelessWidget {
  List<String> _studentsList = [
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

List<String> _count = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _studentsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Text(_count[index], style: TextStyle(fontSize: 30),),
              title: Text(_studentsList[index]),
              subtitle: TextField(),
              trailing: Icon(Icons.favorite),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Second Page'),
      ),
    );
  }
}
