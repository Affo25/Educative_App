

import 'package:educative_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';

import '../viewmodels/quiz_vm.dart';
import 'dashboard_view.dart';
import 'popup_view.dart';

class QuizQuestionScreen extends StatelessWidget {

  final ThemeData themeData = AppTheme.theme;
  final CustomTheme customTheme = AppTheme.customTheme;

  get isFavourite => false;

  get remainingSecond => 100;

  get quizTimeSecond => 2000;

 String selected = "";

  void handleClick(String value) {
    switch (value) {
      case 'Goto Home':
        break;
      case 'Report Question':
        break;
    }
  }

  Widget questionOption(QuizViewModel model,{required String option, int? index}) {
    return GestureDetector(
      onTap: () {
        model.selectOption(index!.toInt());
      },
      child: Container(
        decoration: BoxDecoration(
            color: model.selectedOption == index
                ? AppTheme.theme.colorScheme.primary
                : Colors.transparent,
            border: Border.all(
                color: model.selectedOption == index
                    ? AppTheme.theme.colorScheme.primary
                    : AppTheme.theme.colorScheme.onBackground),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        padding: FxSpacing.fromLTRB(0, 12, 0, 6),
        margin: FxSpacing.fromLTRB(48, 0, 48, 6),
        child: Center(
          child: FxText.bodyLarge(option,
              color: model.selectedOption == index
                  ? AppTheme.theme.colorScheme.onPrimary
                  : AppTheme.theme.colorScheme.onBackground,
              fontWeight: 600),
        ),
      ),
    );
  }

  Widget buildTimer() {
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: CircularProgressIndicator(
             valueColor: remainingSecond > 5
                   ? AlwaysStoppedAnimation<Color>(
                 AppTheme.theme.colorScheme.primary,
              )
                   : AlwaysStoppedAnimation<Color>(
                 customTheme.colorError,
               ),
              value: (quizTimeSecond - remainingSecond) / quizTimeSecond,
            ),
         ),
           Container(
             child: FxText.bodyLarge(remainingSecond.ceil().toString(),
                 color: AppTheme.theme.colorScheme.onBackground, fontWeight: 600),
           )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuizViewModel>.reactive(
      viewModelBuilder: () => QuizViewModel(),
      onViewModelReady: (model)=>model.Init(),
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async {
          var res =  await showExitQuizPopup(context);
          if(res)
          {
           model.gotodashboard();
          }
          return res;
        },
           child: Scaffold(
             appBar: AppBar(
               centerTitle: true,
               title: FxText.titleMedium(model.subname,
               fontSize: 15,
               fontWeight: 600),
               actions: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child:  Icon(Icons.share),
                 ),
                 PopupMenuButton(
                   onSelected: (value) {
                     if(value==1){
                       model.gotodashboard();
                     }if(value==2){
                       model.gotoreport();
                     }if(value==3){
                       model.gotofeedback();
                     }if(value==4){
                       model.gotoQuestions(2);
                     }if(value==5){
                       model.gotoquestion();
                     }

                   },
                   itemBuilder: (context) => [
                     PopupMenuItem(
                       child: Text('Go to Home',style: TextStyle(fontSize: 10),),
                       value: 1,
                     ),
                     PopupMenuItem(
                       child: Text('Report Question', style: TextStyle(fontSize: 10),),
                       value: 2,

                     ),
                     PopupMenuItem(
                       child: Text('Feedback', style: TextStyle(fontSize: 10),),
                       value: 3,

                     ),
                     PopupMenuItem(
                       child: Text('Saved Question', style: TextStyle(fontSize: 10),),
                       value: 4,

                     ),
                     PopupMenuItem(
                       child: Text('Add New Question', style: TextStyle(fontSize: 10),),
                       value: 5,
                     ),
                     PopupMenuItem(
                       child: Text('Help', style: TextStyle(fontSize: 10),),
                       value: 6,
                     ),
                   ],
                 )
               ],
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
                body:Column(
                            children: <Widget>[
                              Container(
                                padding: FxSpacing.fromLTRB(6, 10, 16, 0),
                                child: Row(
                                  children: <Widget>[
                                     Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          FxText.bodyMedium(model.questionHeader,
                                              color: AppTheme.theme.colorScheme.onBackground,
                                              fontWeight: 700)
                                        ],
                                      ),

                                    ),
                                    Column(
                                      children: [
                                        model.HideTimer?Container():Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(width: 4, color: AppTheme.theme.colorScheme.primary),
                                              shape: BoxShape.circle,
                                              color:  Colors.white,
                                            ),
                                            child: Center(
                                              child: Text(model.counterValue.toString(),
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: FxSpacing.fromLTRB(48, 0, 48, 150),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        height: 50,
                                        width: 270,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black,
                                              width: 1.0,
                                              style: BorderStyle.solid
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                        ),
                                        child: FxText.titleLarge(
                                         model.currentQ,
                                          style: TextStyle(color: Colors.black,fontSize: 12),
                                          letterSpacing: 2,
                                          wordSpacing: 2,
                                          color: AppTheme.theme.colorScheme.onPrimary,
                                          fontWeight: 900,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(height: 15,),
                                      Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            model.option1!="" ? questionOption(model,option: model.option1, index: 0):Container(),
                                            model.option2!="" ? questionOption(model,option: model.option2, index: 1):Container(),
                                            model.option3!="" ? questionOption(model,option: model.option3, index: 2):Container(),
                                            model.option4!="" ? questionOption(model,option: model.option4, index: 3):Container(),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            TextButton(
                                                onPressed: () {},
                                                style: TextButton.styleFrom(
                                                  side: BorderSide(color: AppTheme.theme.colorScheme.primary),
                                                ),
                                                child: Row(

                                                  children: <Widget>[
                                                    Icon(
                                                      MdiIcons.chevronLeft,
                                                      color: AppTheme.theme.colorScheme.primary,
                                                      size: 20,
                                                    ),
                                                    Container(
                                                      margin: FxSpacing.left(8),

                                                      child: FxText.bodySmall("PREV",
                                                          letterSpacing: 0.5,
                                                          color: AppTheme.theme.colorScheme.primary,
                                                          fontWeight: 600,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  model.loadNext();
                                                },
                                                style: TextButton.styleFrom(
                                                  side: BorderSide(color: AppTheme.theme.colorScheme.primary),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    FxText.bodySmall(
                                                        model.selectedOption == -1
                                                            ? "SKIP"
                                                            : "NEXT",
                                                        letterSpacing: 0.5,
                                                        color: AppTheme.theme.colorScheme.primary,
                                                        fontWeight: 600),
                                                    Container(
                                                      margin: FxSpacing.left(4),
                                                      child: Icon(
                                                        MdiIcons.chevronRight,
                                                        color: AppTheme.theme.colorScheme.primary,
                                                        size: 20,
                                                      ),
                                                    )
                                                  ],
                                                )),


                                          ],
                                        ),

                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // Container(
                              //   color: customTheme.lightBlack,
                              //   padding: FxSpacing.fromLTRB(32, 0, 32, 2),
                              //   child: Row(
                              //     children: <Widget>[
                              //       InkWell(
                              //         // onTap: () {
                              //         //   setState(() {
                              //         //     isFlag = !isFlag;
                              //         //   });
                              //         // },
                              //         child: Container(
                              //           // child: Icon(
                              //           //   isFlag ? MdiIcons.flag : MdiIcons.flagOutline,
                              //           //   color: isFlag
                              //           //       ? themeData.colorScheme.primary
                              //           //       : themeData.colorScheme.onBackground,
                              //           //   size: 26,
                              //           // ),
                              //         ),
                              //       ),
                              //       Expanded(
                              //         child: Container(
                              //           child: Center(
                              //             child: buildTimer(),
                              //           ),
                              //         ),
                              //       ),
                              //       InkWell(
                              //         // onTap: () {
                              //         //   setState(() {
                              //         //     isFavourite = !isFavourite;
                              //         //   });
                              //         // },
                              //         child: Container(
                              //           child: Icon(
                              //             isFavourite
                              //                 ? MdiIcons.heart
                              //                 : MdiIcons.heartOutline,
                              //             color: isFavourite
                              //                 ? themeData.colorScheme.primary
                              //                 : themeData.colorScheme.onBackground,
                              //             size: 26,
                              //           ),
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // ),

                            ],

            ),
                ),
                ),
               );


  }
  Future<bool> showExitQuizPopup(BuildContext context) async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text('Quit Quiz',style: TextStyle(
              fontSize: 25,
            ),),
            content: Text('Do you want to Quit an Quiz?',style: TextStyle(fontSize: 18),),
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

