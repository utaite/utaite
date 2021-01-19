import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utaite/ui/main/career/main_career_item.dart';
import 'package:utaite/ui/main/career/main_career_model.dart';
import 'package:utaite/ui/main/info/main_info_item.dart';
import 'package:utaite/ui/main/info/main_info_model.dart';
import 'package:utaite/ui/main/main_cubit.dart';
import 'package:utaite/ui/main/main_sliver_app_bar.dart';
import 'package:utaite/ui/main/main_state.dart';
import 'package:utaite/ui/main/skill/main_skill_item.dart';
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

  @override
  Widget build(BuildContext context) {
    final tabList = [
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
    ];
    final bodyList = [
      ..._tabDataMap.values.map((x) {
        final widgetBuilder = ({
          MainInfoModel: () => MainInfoItem(iterable: x.whereType<MainInfoModel>()),
          MainSkillModel: () => MainSkillItem(iterable: x.whereType<MainSkillModel>()),
          MainCareerModel: () => MainCareerItem(iterable: x.whereType<MainCareerModel>()),
        }[x.firstOrNull.runtimeType]);

        return (widgetBuilder?.call()).elvis;
      }),
    ];

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
                        context.read<MainCubit>().update(index: index);
                      },
                      indicatorColor: Theme.of(context).textTheme.overline?.color?.elvis,
                      tabs: tabList,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: BlocBuilder<MainCubit, MainState>(
                          builder: (context, state) {
                            return bodyList[state.index];
                          },
                        ),
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
