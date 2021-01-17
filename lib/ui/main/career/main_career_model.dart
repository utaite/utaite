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
}
