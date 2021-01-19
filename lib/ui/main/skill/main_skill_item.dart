import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:utaite/ui/main/skill/main_skill_model.dart';
import 'package:utaite/ui/main/skill/main_skill_painter.dart';
import 'package:utaite/util/util.dart';

class MainSkillItem extends StatelessWidget {
  const MainSkillItem({
    Key? key,
    required this.iterable,
  }) : super(key: key);

  final Iterable<MainSkillModel> iterable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UI.padding,
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          ...iterable.toList().asMap().entries.expand((x) => [
                if (x.key > 0)
                  TableRow(
                    children: UI.paddingHeightMediumSizedBox * 2,
                  ),
                TableRow(
                  children: [
                    TableCell(
                      child: Text(
                        x.value.name,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: UI.paddingHorizontal,
                        child: StreamBuilder<int>(
                          initialData: 0,
                          stream: Stream.periodic(const Duration(milliseconds: 10), (i) => i).take(x.value.value * 5),
                          builder: (context, snapshot) {
                            return CustomPaint(
                              painter: MainSkillPainter(
                                color: x.value.color,
                                value: snapshot.data.elvis / 5,
                                maxValue: 10,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ],
        columnWidths: {
          0: IntrinsicColumnWidth(),
          1: FlexColumnWidth(),
        },
      ),
    );
  }
}
