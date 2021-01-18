import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:utaite/util/util.dart';

class MainSliverAppBar extends StatelessWidget {
  const MainSliverAppBar({
    Key? key,
    this.expandedAppBarHeight = UI.expandedAppBarHeight,
    required this.title,
    required this.image,
  }) : super(key: key);

  final double expandedAppBarHeight;

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    print('MainSliverAppBar build');

    return SliverAppBar(
      pinned: true,
      stretch: true,
      expandedHeight: expandedAppBarHeight,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final offset = constraints.maxHeight.getScrollOffset(height: expandedAppBarHeight);
          final opacity = Tween<double>(begin: 1.0, end: 0.0).transform(offset);
          final scale = Tween<double>(begin: 1.5, end: 1.0).transform(offset);
          final titleWidget = SelectableText(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          );

          return FlexibleSpaceBar(
            centerTitle: true,
            collapseMode: CollapseMode.pin,
            title: titleWidget,
            background: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final minValue = min(constraints.maxHeight * 2 / 3, constraints.maxWidth * 2 / 3);

                      return SizedBox(
                        height: minValue,
                        width: minValue,
                        child: ClipRRect(
                          borderRadius: UI.borderRadiusCircle,
                          child: Opacity(
                            opacity: opacity,
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Colors.transparent.withOpacity(1 - opacity),
                                BlendMode.saturation,
                              ),
                              child: Image.asset(
                                image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                UI.paddingHeightSizedBox,
                Padding(
                  padding: EdgeInsets.only(bottom: 16 * scale),
                  child: Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()..scale(scale, scale, 1.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) => ConstrainedBox(
                        constraints: BoxConstraints.loose(Size.fromWidth(constraints.maxWidth / scale)),
                        child: Opacity(
                          opacity: 0,
                          child: titleWidget,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
