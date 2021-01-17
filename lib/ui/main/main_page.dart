import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rxdart/rxdart.dart';
import 'package:utaite/ui/main/career/main_career_item.dart';
import 'package:utaite/ui/main/career/main_career_model.dart';
import 'package:utaite/ui/main/info/main_info_item.dart';
import 'package:utaite/ui/main/info/main_info_model.dart';
import 'package:utaite/ui/main/main_sliver_app_bar.dart';
import 'package:utaite/util/util.dart';

final Map<String, List<dynamic>> _tabDataMap = {
  '프로젝트': [],
  '경력': MainCareerModel.init,
  '정보': MainInfoModel.init,
};

class MainPage extends StatelessWidget {
  MainPage({
    Key? key,
  }) : super(key: key);

  final BehaviorSubject<int> _indexSubject = BehaviorSubject();

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
              constraints: BoxConstraints.loose(Size.fromWidth(400)),
              child: DefaultTabController(
                initialIndex: _tabDataMap.length - 1,
                length: _tabDataMap.length,
                child: (() {
                  final tabBarWidth = _tabDataMap.keys.map((x) => x.length).reduce(max) * UI.paddingValue;

                  return Stack(
                    children: [
                      SizedBox(
                        height: UI.paddingValue * 9,
                        width: tabBarWidth,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: TabBar(
                            onTap: (index) {
                              _indexSubject.sink.add(index);
                            },
                            indicatorColor: Theme.of(context).textTheme.overline?.color?.elvis,
                            indicatorPadding: UI.paddingMediumHorizontal,
                            tabs: [
                              ..._tabDataMap.keys.map((x) => RotatedBox(
                                    quarterTurns: 1,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: UI.paddingSmallRight,
                                        child: Text(
                                          x,
                                          style: Theme.of(context).textTheme.subtitle1,
                                          strutStyle: Theme.of(context).textTheme.subtitle1?.let((x) => StrutStyle.fromTextStyle(x)),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: tabBarWidth),
                        child: StreamBuilder<int>(
                          initialData: _tabDataMap.length - 1,
                          stream: _indexSubject.stream,
                          builder: (context, snapshot) {
                            return IndexedStack(
                              index: snapshot.data,
                              children: [
                                ..._tabDataMap.values.map((x) {
                                  final widgetBuilder = ({
                                    MainInfoModel: () => MainInfoItem(iterable: x.whereType<MainInfoModel>()),
                                    MainCareerModel: () => MainCareerItem(iterable: x.whereType<MainCareerModel>())
                                  }[x.firstOrNull.runtimeType]);

                                  return (widgetBuilder?.call()).elvis;
                                }),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                })(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
