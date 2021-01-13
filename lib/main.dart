import 'package:flutter/material.dart';
import 'package:utaite/ui/app_page.dart';
import 'package:utaite/util/util.dart';

void main() {
  print('main ${now}');

  WidgetsFlutterBinding.ensureInitialized();

  runApp(AppPage());
}
