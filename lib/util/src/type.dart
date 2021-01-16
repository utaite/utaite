import '../util.dart';

enum DateType {
  year,
  month,
  date,
}

extension DateTypeEx on DateType {
  String get dateFormat => {
        DateType.year: 'yyyy년',
        DateType.month: 'yyyy년 MM월',
        DateType.date: 'yyyy년 MM월 dd일',
      }[this]
          .elvis;
}
