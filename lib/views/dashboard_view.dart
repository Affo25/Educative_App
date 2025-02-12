import 'dart:io';

import 'package:educative_app/app_theme.dart';
import 'package:educative_app/viewmodels/dashboard_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:stacked/stacked.dart';

import 'Nvbar.dart';

class DashboardScreen extends StatelessWidget {
  final ThemeData themeData = AppTheme.theme;
  final CustomTheme customTheme = AppTheme.customTheme;


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
        viewModelBuilder: () => DashboardViewModel(),
        onViewModelReady: (model) => model.Init(),
        builder: (context, model, child) =>
            WillPopScope(
              onWillPop: () async {
                if (model.catType == "main") {
                  var res =  await showExitPopup(context);
                  if(res)
                    {
                      exit(0);
                    }
                  return res;
                }
                else {
                  model.showMain();
                  return false;
                }
              },
              child: Scaffold(
                  drawer: nav_BarWidget(),
                  appBar: AppBar(
                    centerTitle: true,
                    title: FxText.titleMedium("Categories", fontWeight: 600),
                    flexibleSpace: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Colors.blue,
                                Colors.blue
                              ])
                      ),
                    ),
                  ),
                  body: model.isBusy ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          backgroundColor: Colors.black,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 10,),
                        Text("fetching data..please wait..",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold,),),
                      ],
                    ),

                  ) :
                  Stack(
                    children: [
                      (model.catType == "main" ?
                      Container(
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return singleTask(
                                  model, model.categoryList[index].CatID,
                                  '','main',
                                  image: 'assets/images/images.png',
                                  Title: model.categoryList[index].Title
                              );
                            }),
                      ) :
                      Container(
                        child: ListView.builder(
                            itemCount: model.subList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return singleTask(
                                  model, model.subList[index].SubID, model.subList[index].Name,'sub',
                                  image: 'assets/images/images.png',
                                  Title: model.subList[index].Name
                              );
                            }),
                      ))

                    ],
                  )
              ),
            )
    );
  }

  Widget singleTask(DashboardViewModel model, int catId,  String Name,String type,
      {String? Title, String? image}) {
    return FxContainer.bordered(
      paddingAll: 5,
      margin: FxSpacing.fromLTRB(24, 8, 24, 8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 4,
      child: GestureDetector(
        onTap: () =>
        {
          if(type == 'main')
            {
              model.gotoSubCategory(catId)
            }
          else
            {
              model.gotoQuestions(catId, Name)
            }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 50,
              margin: FxSpacing.left(0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: FxSpacing.all(2),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        child: Image(
                          image: AssetImage(image!),
                          alignment: Alignment.topLeft,
                          height: 48,
                          width: 48,
                        )),
                  ),
                  Container(
                    margin: FxSpacing.left(135),
                    height: 50,
                    alignment: Alignment.centerLeft,
                    child: FxText.bodyLarge(Title!,
                        color: Colors.black,
                        fontWeight: 600),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Future<bool> showExitPopup(BuildContext context) async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text('Exit App',style: TextStyle(
              fontSize: 25,
            ),),
            content: Text('Do you want to exit an App?',style: TextStyle(fontSize: 18),),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text('No',style: TextStyle(fontSize: 16),),
              ),

              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                //return true when click on "Yes"
                child: Text('Yes',style: TextStyle(fontSize: 16),),
              ),

            ],
          ),
    ) ?? false; //if showDialouge had returned null, then return false

  }
}