import 'package:flutter/material.dart';
import 'package:utaite/ui/main/main_page.dart';
import 'package:utaite/util/src/ui.dart';

enum AppRoute {
  main,
}

extension AppRouteEx on AppRoute {
  WidgetBuilder get widgetBuilder => appRouteWidgetBuilder[toString()] ?? (_) => UI.empty;
}

final Map<String, WidgetBuilder> appRouteWidgetBuilder = {
  '/': (_) => UI.empty,
  AppRoute.main.toString(): (_) => MainPage(),
};
