import 'package:flutter/cupertino.dart';
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
                title: Text(x.title),
                subtitle: Text(x.dateTimeFormat),
                content: UI.empty,
                state: x.state,
              )),
        ],
      ),
    );
  }
}
