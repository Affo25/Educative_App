/*
* File : Account Dialog
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:educative_app/app_theme.dart';
import 'package:educative_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:educative_app/app/app.locator.dart';
import 'package:educative_app/app/app.router.dart';
import '../services/database_service.dart';
import '../viewmodels/resultdetail_vm.dart';
import 'package:stacked/stacked.dart';
class ResultDetailScreen extends StatelessWidget {
  final ThemeData themeData = AppTheme.theme;
  final CustomTheme customTheme = AppTheme.customTheme;
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ViewModelBuilder<ResultDetailViewModel>.reactive(
        viewModelBuilder: () => ResultDetailViewModel(),
        onViewModelReady: (model) => model.Init(),
        builder: (context, model, child) =>
            WillPopScope(
                onWillPop: () async {
                  return true;
                },
                child: Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      height: 327,
                      width: 195,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                width: 280,
                                color: Colors.blue,
                                child: Center(child: Text("RESULT DETAIL",style: TextStyle(color: Colors.white,fontSize: 19),)),
                              ),
                              Column(
                                children: [
                                  Card(
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 1,top: 10,bottom: 20),
                                          height: 50,
                                          color: Colors.white,
                                          child: Text("Total",textAlign: TextAlign.left,style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),),
                                        ),
                                        VerticalDivider(color: Colors.black,),
                                        Container(
                                          height: 50,
                                          padding: EdgeInsets.only(left: 197, right:5,top: 10),
                                          child:Text(model.total.toString(),textAlign: TextAlign.right
                                            ,style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Card(
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 1,top: 10,bottom: 20),
                                          height: 50,
                                          color: Colors.white,
                                          child: Text("Correct",textAlign: TextAlign.left,style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),),
                                        ),
                                        VerticalDivider(color: Colors.black,),
                                        Container(
                                          height: 50,
                                          padding: EdgeInsets.only(left: 177, right:5,top: 10),
                                          child:Text(model.correct.toString(),textAlign: TextAlign.right
                                            ,style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Card(
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 1,top: 10,bottom: 20),
                                          height: 50,
                                          color: Colors.white,
                                          child: Text("Wrong",textAlign: TextAlign.left,style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),),
                                        ),
                                        VerticalDivider(color: Colors.black,),
                                        Container(
                                          height: 50,
                                          padding: EdgeInsets.only(left: 184, right:5,top: 10),
                                          child:Text(model.wrong.toString(),textAlign: TextAlign.right
                                            ,style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Card(
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 1,top: 10,bottom: 20),
                                          height: 50,
                                          color: Colors.white,
                                          child: Text("Skipped",textAlign: TextAlign.left,style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),),
                                        ),
                                        VerticalDivider(color: Colors.black,),
                                        Container(
                                          height: 50,
                                          padding: EdgeInsets.only(left: 170, right:5,top: 10),
                                          child:Text(model.skipped.toString(),textAlign: TextAlign.right
                                            ,style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      FxButton(
                                        onPressed: (){
                                          _navigationService.navigateTo(Routes.dashboardView);
                                        },
                                        child: Container(
                                          height: 55,
                                          width: 110,
                                          child: Center(
                                            child: Text("BACK TO MAIN",style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          ),
                                        ),
                                      ),
                                      FxButton(
                                        onPressed: (){
                                          _navigationService.navigateTo(Routes.resultview);
                                        },
                                        child: Container(
                                          height: 55,
                                          width: 106,
                                          color: Colors.blue,
                                          child: Center(
                                            child: Text("VIEW DETAIL",style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ))));
  }
}
