/*
* File : Navigation Drawer widget
* Version : 1.0.0
* Description :
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:stacked_services/stacked_services.dart';
 import 'package:educative_app/app_theme.dart';
import 'package:educative_app/app/app.locator.dart';
import 'package:educative_app/app/app.router.dart';
 import 'package:educative_app/services/database_service.dart';
import 'package:stacked/stacked.dart';
import '../viewmodels/profile_vm.dart';


class nav_BarWidget extends StatelessWidget {
  final ThemeData themeData = AppTheme.theme;
  final CustomTheme customTheme = AppTheme.customTheme;
  final _databaseService = locator<DatabaseService>();
  final _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      onViewModelReady: (model) => model.Init(),
      builder: (context, model, child) =>
          WillPopScope(
            onWillPop: () async {
              return true;
            },
    child: Drawer(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  /*---------- Drawer Header ----------------*/
                  Expanded(
                    flex: 2,
                    child: DrawerHeader(
                      padding: FxSpacing.all(0),
                      margin: FxSpacing.all(0),
                      decoration: BoxDecoration(
                          color: AppTheme.theme.primaryColor),
                      child: Container(
                        child: Padding(
                          padding: FxSpacing.fromLTRB(16, 0, 16, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image:
                                                AssetImage(
                                                    'assets/images/images.png'),
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  FxText.titleLarge(model.currentUser?.Name ?? "",
                                      fontWeight: 600,
                                      color: AppTheme.theme.colorScheme
                                          .onPrimary),
                                  FxText.bodyMedium(model.currentUser?.Email ?? "",
                                      color: AppTheme.theme.colorScheme
                                          .onPrimary,
                                      fontWeight: 400)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  /*------------- Drawer Content -------------*/
                  Expanded(
                    flex: 6,
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: FxSpacing.bottom(8),
                        child: ListView(
                          padding: FxSpacing.all(10),
                          children: <Widget>[
                            GestureDetector(
                              child: singleDrawerItem(
                                  Icons.question_answer_sharp, "Add new Question", 13),
                              onTap: ()=>{
                                _navigationService.navigateTo(Routes.quesview)
                              },
                            ),
                            Divider(
                              height: 1,
                              color: AppTheme.theme.dividerColor,
                              thickness: 1,
                            ),
                            GestureDetector(
                             child: singleDrawerItem(
                                  Icons.favorite, "Saved Question", 1),
                              onTap: ()=>{
                                _navigationService.navigateTo(Routes.quiz_detailview)
                              },
                            ),

                            GestureDetector(
                              child: singleDrawerItem(
                                  Icons.feedback_sharp, "FeedBack", 13),
                              onTap: ()=>{
                                _navigationService.navigateTo(Routes.feedbackview)
                              },
                            ),
                            GestureDetector(
                              child: singleDrawerItem(
                                  Icons.history, "Quiz History", 13),
                              onTap: ()=>{
                                _navigationService.navigateTo(Routes.resultview)
                              },
                            ),
                            Divider(
                              height: 1,
                              color: Colors.white,
                              thickness: 1,
                            ),
                            GestureDetector(
                              child: singleDrawerItem(
                                  Icons.report, "Report Question", 13),
                              onTap: ()=>{
                                _navigationService.navigateTo(Routes.reportquestionview)
                              },
                            ),
                            Divider(
                              height: 1,
                              color: AppTheme.theme.dividerColor,
                              thickness: 1,
                            ),
                            GestureDetector(
                              child: singleDrawerItem(
                                  Icons.logout_outlined, "Logout", 13),
                              onTap: ()=>{
                                _databaseService.removeUser(),
                              _navigationService.navigateTo(Routes.loginView)
                                //navigator
                                // message show kese krty hen?
                                //print("sdfksjdh")
                              },
                            ),

                           ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ))));
  }

  Widget singleDrawerItem(IconData iconData, String title, int position) {
    var _selectedPage;
    return ListTile(
      dense: true,
      contentPadding: FxSpacing.x(16),
      leading: Icon(iconData,
          size: 20,
          color: Colors.black54),
      title: Text(title,
          style: AppTheme.theme.textTheme.titleMedium!
              .merge(TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
          wordSpacing: 1,))
              .merge(TextStyle(
              color:  Colors.black54,
      fontSize: 16,
      // onTap: () {
      //   setState(() {
      //     _selectedPage = position;
      //   });
      //   _scaffoldKey.currentState!.openEndDrawer();
      // },
    ))));
  }



}
