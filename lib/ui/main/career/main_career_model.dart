import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:utaite/ui/widget/custom_stepper.dart' as custom_stepper;
import 'package:utaite/util/util.dart';

class MainCareerModel {
  const MainCareerModel({
    required this.title,
    required this.dateType,
    required this.dateTime,
    required this.state,
  });

  final String title;
  final DateTimeRange dateTime;
  final DateType dateType;
  final custom_stepper.StepState state;

  String get dateTimeFormat => [dateTime.start, state == custom_stepper.StepState.complete ? dateTime.end : null]
      .map((x) => (x?.toString()).isset ? DateFormat(dateType.dateFormat).format(DateTime.parse(x.toString())) : '')
      .join(' ~ ');

  static final init = [
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
}
