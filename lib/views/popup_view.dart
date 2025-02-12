import 'package:educative_app/app/globals.dart';
import 'package:educative_app/views/Quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import '../app/app.locator.dart';
import '../app_theme.dart';
import '../theme/custom_theme.dart';
import 'package:stacked_services/stacked_services.dart';

class SelectDialog extends StatelessWidget {
  final _navigationService = locator<NavigationService>();
  final ThemeData themeData = AppTheme.theme;
  final CustomTheme customTheme = AppTheme.customTheme;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Center(
            child: GestureDetector(
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Preparation Mode",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              onTap: () {
                globals.examMode = "Prepare Mode";
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(builder: (context) => QuizQuestionScreen()),
                );
              },
            ),
          ),
          Divider(
            height: 4,
          ),
          Column(
            children: [
              GestureDetector(
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Test Mode",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                  onTap: () {
                    globals.examMode = "Test Mode";
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) => QuizQuestionScreen()),
                    );
                  })
            ],
          ),
        ],
      ),
    );
  }
}
