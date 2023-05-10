import 'package:educative_app/app_theme.dart';
import 'package:educative_app/views/New_Question.dart';
import 'package:educative_app/views/profile.dart';
import 'package:flutx/flutx.dart';
import 'package:flutter/material.dart';
import '../views/dashboard_view.dart';
import 'subcategory.dart';


class FullAppScreen extends StatelessWidget {



  final ThemeData themeData = AppTheme.theme;
  final CustomTheme customTheme = AppTheme.customTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FxBottomNavigationBar(
        containerDecoration: BoxDecoration(
          color: customTheme.border,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        activeContainerColor: customTheme.medicarePrimary.withAlpha(30),
        fxBottomNavigationBarType: FxBottomNavigationBarType.containered,
        showActiveLabel: false,
        showLabel: false,
        activeIconSize: 24,
        iconSize: 24,
        activeIconColor: customTheme.medicarePrimary,
        iconColor: themeData.colorScheme.onBackground.withAlpha(140),
        itemList: [
          FxBottomNavigationBarItem(
            page: DashboardScreen(),
            activeIconData: Icons.house,
            iconData: Icons.house_outlined,
          ),
          FxBottomNavigationBarItem(
            page: DashboardScreen(),
            activeIconData: Icons.date_range,
            iconData: Icons.date_range_outlined,
          ),
          FxBottomNavigationBarItem(
            page: Questionscreen(),
            activeIconData: Icons.chat_bubble,
            iconData: Icons.add,
          ),
          FxBottomNavigationBarItem(
            page: ProfileScreen(),
            activeIconData: Icons.person,
            iconData: Icons.person_outline_rounded,
          ),
        ],
      ),
    );
  }
}
