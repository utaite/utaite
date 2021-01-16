import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utaite/ui/main/main_page.dart';
import 'package:utaite/util/util.dart';

class AppPage extends StatelessWidget {
  AppPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      title: 'Utaite',
      theme: ThemeData.dark().let((x) => x.copyWith(
            primaryColor: x.textTheme.overline?.color,
            accentColor: x.textTheme.overline?.color,
            iconTheme: x.iconTheme.copyWith(
              size: UI.iconSize,
            ),
            appBarTheme: x.appBarTheme.copyWith(
              color: x.scaffoldBackgroundColor,
            ),
            textTheme: x.textTheme.copyWith(
              headline1: x.textTheme.headline1?.copyWith(
                color: x.textTheme.overline?.color,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
              headline2: x.textTheme.headline2?.copyWith(
                color: x.textTheme.overline?.color,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
              headline3: x.textTheme.headline3?.copyWith(
                color: x.textTheme.overline?.color,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
              headline4: x.textTheme.headline4?.copyWith(
                color: x.textTheme.overline?.color,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
              headline5: x.textTheme.headline5?.copyWith(
                height: 1,
              ),
              headline6: x.textTheme.headline6?.copyWith(
                height: 1,
              ),
              caption: x.textTheme.caption?.copyWith(
                color: Colors.grey,
                height: 1,
              ),
            ),
          )),
    );
  }
}
