import 'package:educative_app/app_theme.dart';
import 'package:educative_app/views/New_Question.dart';
import 'package:educative_app/views/popup_view.dart';
import 'package:educative_app/views/profile.dart';
import 'package:flutx/flutx.dart';
import 'package:flutter/material.dart';
import '../views/dashboard_view.dart';


class FullAppScreen extends StatelessWidget {

  final ThemeData themeData = AppTheme.theme;
  final CustomTheme customTheme = AppTheme.customTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FxBottomNavigationBar(
        containerDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        activeContainerColor: customTheme.medicarePrimary.withAlpha(30),
        fxBottomNavigationBarType: FxBottomNavigationBarType.containered,
        showActiveLabel: false,
        showLabel: false,
        activeIconSize: 24,
        iconSize: 24,
        titleColor: customTheme.lightBlack,
        activeIconColor: customTheme.medicarePrimary,
        iconColor: Colors.black,
        itemList: [
          FxBottomNavigationBarItem(
            page: DashboardScreen(),
            activeIconData: Icons.house,
            iconData: Icons.house_outlined,
          ),
          FxBottomNavigationBarItem(
            page: SelectDialog(),
            activeIconData: Icons.search_off_rounded,
            iconData: Icons.search,
          ),
          FxBottomNavigationBarItem(
            page: Questionscreen(),
            activeIconData: Icons.question_answer,
            iconData: Icons.add,
            //activeIconColor: Colors.black,
          ),
          FxBottomNavigationBarItem(
            page: ProfileScreen(),
            activeIconData: Icons.person,
            iconData: Icons.person_outline_rounded,
            //activeIconColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
