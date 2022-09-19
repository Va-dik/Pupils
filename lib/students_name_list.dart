class Constants {
  static const List<String> firstStudentsList = [
    'Ахремчик Вадим ',
    'Бесман Ярослав ',
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

  static const List<String> secondStudentsList = [
    'Николаевич Ангелина',
    'Пашковский Артём',
    'Поцейко Никита',
    'Самулёв Степан',
    'Сарнавский Артём',
    'Свирко Анастасия',
    'Секацкая Диана',
    'Сидорович Даниил',
    'Старовойтов Максим',
    'Фурманов Михаил',
    'Шарахай Алексей',
    'Якимов Антон',
    'Якимцев Никита',
    'Ярмоленко Максим',
  ];

  static List<List<String>> groupList = [firstStudentsList, secondStudentsList];

  static List<String> groupName = ["ПОИТ-1", "ПОИТ-2"];

  /*static void setGroup(String groupName) {
    for (int i = 0; i < groupList.length; i++)
      if (groupList[i] != groupName) groupList.add(groupName);
  }
  */

  static Map<int, String> fRating = {};
  static Map<int, String> sRating = {};
}
