import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:utaite/ui/main/career/main_career_model.dart';
import 'package:utaite/ui/widget/custom_stepper.dart' as custom_stepper;
import 'package:utaite/util/util.dart';

class MainCareerItem extends StatelessWidget {
  const MainCareerItem({
    Key? key,
    required this.iterable,
  }) : super(key: key);

  final Iterable<MainCareerModel> iterable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: UI.paddingValue),
      child: custom_stepper.CustomStepper(
        controlsBuilder: (context, {onStepCancel, onStepContinue}) {
          return UI.empty;
        },
        physics: NeverScrollableScrollPhysics(),
        steps: [
          ...iterable.map((x) => custom_stepper.Step(
                title: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      js.context.callMethod('open', [x.url]);
                    },
                    child: Text(
                      x.title,
                      style: Theme.of(context).textTheme.subtitle1,
                      strutStyle: Theme.of(context).textTheme.subtitle1?.let((x) => StrutStyle.fromTextStyle(x)),
                    ),
                  ),
                ),
                subtitle: Text(
                  x.dateTimeFormat,
                  style: Theme.of(context).textTheme.caption,
                  strutStyle: Theme.of(context).textTheme.caption?.let((x) => StrutStyle.fromTextStyle(x)),
                ),
                content: UI.empty,
                state: x.state,
              )),
        ],
      ),
    );
  }
}
