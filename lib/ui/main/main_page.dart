import 'dart:js' as js;
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:utaite/ui/main/career/main_career_model.dart';
import 'package:utaite/ui/main/info/main_info_model.dart';
import 'package:utaite/ui/main/main_sliver_app_bar.dart';
import 'package:utaite/ui/widget/custom_stepper.dart' as custom_stepper;
import 'package:utaite/util/util.dart';

final List<MainInfoModel> _infoList = [
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

final List<MainCareerModel> _careerList = [
  MainCareerModel(
    title: '양영디지털고등학교',
    dateType: DateType.month,
    dateTime: DateTimeRange(
      start: DateTime(2014, 3),
      end: DateTime(2017, 2),
    ),
    state: custom_stepper.StepState.complete,
  ),
  MainCareerModel(
    title: 'n2soft',
    dateType: DateType.date,
    dateTime: DateTimeRange(
      start: DateTime(2016, 12, 27),
      end: DateTime(2017, 12, 01),
    ),
    state: custom_stepper.StepState.complete,
  ),
  MainCareerModel(
    title: 'G.I.ANT corp',
    dateType: DateType.date,
    dateTime: DateTimeRange(
      start: DateTime(2018, 3, 12),
      end: DateTime.now(),
    ),
    state: custom_stepper.StepState.indexed,
  ),
];

class MainPage extends StatelessWidget {
  MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MainPage build');

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              MainSliverAppBar(
                title: 'JeongHwan Song',
                image: 'https://avatars3.githubusercontent.com/u/24307726?s=460&u=9a33419115f38209c8e4b1a6830da9faf61849f6&v=4',
                expandedAppBarHeight: max(UI.expandedAppBarHeight, MediaQuery.of(context).size.height / 3),
              ),
            ];
          },
          body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints.loose(Size.fromWidth(300)),
              child: Column(
                children: [
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      ..._infoList.asMap().entries.expand((x) => [
                            if (x.key > 0)
                              TableRow(
                                children: UI.paddingHeightMediumSizedBox * 2,
                              ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: (() {
                                    final widgetBuilder = ({
                                      IconData: () => Icon(x.value.resource),
                                      String: () => Image.asset(x.value.resource),
                                    }[x.value.resource.runtimeType]);
                                    final widget = (widgetBuilder?.call()).elvis;

                                    if (x.value.url.isset) {
                                      return MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () {
                                            js.context.callMethod('open', [x.value.url]);
                                          },
                                          child: widget,
                                        ),
                                      );
                                    } else {
                                      return widget;
                                    }
                                  })(),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: UI.paddingMediumHorizontal,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        x.value.text,
                                        style: Theme.of(context).textTheme.subtitle1,
                                        strutStyle: Theme.of(context).textTheme.subtitle1?.let((x) => StrutStyle.fromTextStyle(x)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ],
                    columnWidths: {
                      0: FixedColumnWidth(UI.iconSize),
                      1: IntrinsicColumnWidth(),
                    },
                  ),
                  custom_stepper.CustomStepper(
                    controlsBuilder: (context, {onStepCancel, onStepContinue}) => Align(
                      alignment: Alignment.centerLeft,
                      child: UI.empty,
                    ),
                    steps: [
                      ..._careerList.map((x) => custom_stepper.Step(
                            title: Text(x.title),
                            subtitle: Text(x.dateTimeFormat),
                            content: UI.empty,
                            state: x.state,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
