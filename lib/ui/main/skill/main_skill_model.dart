import 'package:flutter/material.dart';

class MainSkillModel {
  const MainSkillModel({
    required this.name,
    required this.color,
    required this.value,
  });

  final String name;
  final Color color;
  final int value;

  static const init = [
    MainSkillModel(
      name: 'Kotlin',
      color: Color(0xFFF18E33),
      value: 8,
    ),
    MainSkillModel(
      name: 'Dart',
      color: Color(0xFF00B4AB),
      value: 7,
    ),
    MainSkillModel(
      name: 'Java',
      color: Color(0xFFB07219),
      value: 6,
    ),
    MainSkillModel(
      name: 'Python',
      color: Color(0xFF3572A5),
      value: 6,
    ),
    MainSkillModel(
      name: 'JavaScript',
      color: Color(0xFFF1E05A),
      value: 5,
    ),
  ];
}
