/*
* File : Account Dialog
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:educative_app/app_theme.dart';
import 'package:educative_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/database_service.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

import '../viewmodels/result_vm.dart';

class ResultScreen extends StatelessWidget {
  final ThemeData themeData = AppTheme.theme;
  final CustomTheme customTheme = AppTheme.customTheme;
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ViewModelBuilder<ResultViewModel>.reactive(
        viewModelBuilder: () => ResultViewModel(),
        onViewModelReady: (model) => model.Init(),
        builder: (context, model, child) => WillPopScope(
              onWillPop: () async {
                model.gotodashboard();
                return true;
              },
              child: Scaffold(
                appBar: AppBar(
                  title: Center(child: Text("QuizHistory",style: TextStyle(fontSize: 20),)),
                ),
                body: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(height: 10),
                    Container(
                      height: MediaQuery.of(context).size.height - 100,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          itemCount: model.resultDetailList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return
                              singleTask(
                                model,
                                model.resultDetailList[index].ResID,
                                model.resultDetailList[index].UserID,
                                model.resultDetailList[index].Name,
                                model.resultDetailList[index].Title,
                                model.resultDetailList[index].CreatedOn)  ;
                          }),
                    )
                  ],
                ),
              ),
              ),));
  }
}

Widget singleTask(ResultViewModel model, int resId,int userid, String name,
    String title, DateTime date) {
  return FxContainer.bordered(
    paddingAll: 5,
    margin: FxSpacing.fromLTRB(24, 8, 24, 8),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    borderRadiusAll: 4,
    child: GestureDetector(
      onTap: () => {
        model.gotoResultDetail(resId,userid)
      },
        child: Card(
          child: Column(
            children: <Widget>[
                 Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20,left: 8),
                      height: 65,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(name,style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                    ),
                    Container(
                      width: 90,
                      padding: EdgeInsets.only(left: 20,top: 20),
                      child: Text(DateFormat(' EEEE-d-MMM-yy ').format(date), style: TextStyle(fontSize: 10, fontWeight:FontWeight.bold,color: Colors.black),),
                    ),
                  ],
                ),
              Container(
                padding: EdgeInsets.only(right: 240,bottom: 10),
                child: Column(
                  children: [
                  Text(title,style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),)
                ],),
              ),
              ],
          ),
        ),
    ),
  );
}
