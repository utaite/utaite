import 'dart:js' as js;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:utaite/ui/main/info/main_info_model.dart';
import 'package:utaite/util/util.dart';

class MainInfoItem extends StatelessWidget {
  const MainInfoItem({
    Key? key,
    required this.iterable,
  }) : super(key: key);

  final Iterable<MainInfoModel> iterable;

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
                      child: (() {
                        final widgetBuilder = ({
                          IconData: () => Icon(x.value.resource),
                          String: () => Image.asset(
                                x.value.resource,
                                fit: BoxFit.cover,
                              ),
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
                        padding: UI.paddingHorizontal,
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
    );
  }
}
