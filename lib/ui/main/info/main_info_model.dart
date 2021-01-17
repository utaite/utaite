import 'package:flutter/material.dart';

class MainInfoModel {
  const MainInfoModel({
    required this.resource,
    required this.text,
    this.url,
  });

  final dynamic resource;
  final String text;
  final String? url;

  static const init = [
    MainInfoModel(
      resource: Icons.info,
      text: '산업기능요원(현역)',
    ),
    MainInfoModel(
      resource: '/github.png',
      text: 'utaite',
      url: 'https://github.com/utaite',
    ),
    MainInfoModel(
      resource: Icons.mail,
      text: 'utaite6888@gmail.com',
      url: 'mailto:utaite6888@gmail.com',
    ),
  ];
}
