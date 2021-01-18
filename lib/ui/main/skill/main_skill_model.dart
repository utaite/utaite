import 'package:flutter/material.dart';

class MainSkillModel {
  const MainSkillModel({
    required this.name,
    required this.color,
    required this.value,
    this.align = -1,
  });

  final String name;
  final Color color;
  final int value;
  final int align;

  static const init = [
    MainSkillModel(
      name: 'Kotlin',
      color: Color(0xFF139DFE),
      value: 8,
    ),
    MainSkillModel(
      name: 'Dart',
      color: Color(0xFF18CBA9),
      value: 6,
    ),
    MainSkillModel(
      name: 'Java',
      color: Color(0xFFD70019),
      value: 6,
    ),
    MainSkillModel(
      name: 'Python',
      color: Color(0xFF2B6097),
      value: 5,
    ),
    MainSkillModel(
      name: 'JavaScript',
      color: Color(0xFFECD63F),
      value: 5,
    ),
    MainSkillModel(
      name: 'Android',
      color: Color(0xFF8EB72B),
      value: 8,
      align: 1,
    ),
    MainSkillModel(
      name: 'Flutter',
      color: Color(0xFF0F7BE4),
      value: 6,
      align: 1,
    ),
  ];
}
