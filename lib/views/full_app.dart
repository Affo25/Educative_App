import 'package:educative_app/app_theme.dart';
import 'package:flutx/flutx.dart';
import 'package:flutter/material.dart';
import '../views/login_view.dart';
import '../views/register_view.dart';
import '../views/dashboard_view.dart';
import '../views/splash.dart';


class FullApp extends StatefulWidget {
  @override
  _FullAppState createState() => _FullAppState();
}

class _FullAppState extends State<FullApp> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FxBottomNavigationBar(
        containerDecoration: BoxDecoration(
          color: customTheme.card,
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
        iconColor: theme.colorScheme.onBackground.withAlpha(140),
        itemList: [
          FxBottomNavigationBarItem(
            page: DashboardScreen(),
            activeIconData: Icons.house,
            iconData: Icons.house_outlined,
          ),
          FxBottomNavigationBarItem(
            page: RegisterView(),
            activeIconData: Icons.date_range,
            iconData: Icons.date_range_outlined,
          ),
          FxBottomNavigationBarItem(
            page: DashboardScreen(),
            activeIconData: Icons.chat_bubble,
            iconData: Icons.chat_bubble_outline_rounded,
          ),
          FxBottomNavigationBarItem(
            page: SplashView(),
            activeIconData: Icons.person,
            iconData: Icons.person_outline_rounded,
          ),
        ],
      ),
    );
  }
}
