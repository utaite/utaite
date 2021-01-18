import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rxdart/rxdart.dart';
import 'package:utaite/ui/main/career/main_career_item.dart';
import 'package:utaite/ui/main/career/main_career_model.dart';
import 'package:utaite/ui/main/info/main_info_item.dart';
import 'package:utaite/ui/main/info/main_info_model.dart';
import 'package:utaite/ui/main/main_sliver_app_bar.dart';
import 'package:utaite/ui/main/skill/main_skill_model.dart';
import 'package:utaite/util/util.dart';

final Map<String, List<dynamic>> _tabDataMap = {
  '정보': MainInfoModel.init,
  '기술': MainSkillModel.init,
  '경력': MainCareerModel.init,
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
                image: '/profile.jpg',
                expandedAppBarHeight: max(UI.expandedAppBarHeight, MediaQuery.of(context).size.height / 3),
              ),
            ];
          },
          body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints.loose(Size.fromWidth(400)),
              child: DefaultTabController(
                initialIndex: 0,
                length: _tabDataMap.length,
                child: Column(
                  children: [
                    TabBar(
                      onTap: (index) {
                        _indexSubject.sink.add(index);
                      },
                      indicatorColor: Theme.of(context).textTheme.overline?.color?.elvis,
                      tabs: [
                        ..._tabDataMap.keys.map((x) => Padding(
                          padding: UI.paddingVertical,
                          child: Text(
                            x,
                            style: Theme.of(context).textTheme.headline6,
                            strutStyle: Theme.of(context).textTheme.headline6?.let((x) => StrutStyle.fromTextStyle(x)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                      ],
                    ),
                    Expanded(
                      child: StreamBuilder<int>(
                        initialData: 0,
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
