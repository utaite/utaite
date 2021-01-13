import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:utaite/ui/app_route.dart';

const Map<String, String> _localeList = {
  'en': 'US',
  'ko': 'KR',
  'ja': 'JP',
};

class AppPage extends StatelessWidget {
  AppPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.main.toString(),
      routes: appRouteWidgetBuilder,
      title: 'Utaite',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: _localeList.entries.map((x) => Locale(x.key, x.value)),
      theme: ThemeData.dark(),
    );
  }
}
