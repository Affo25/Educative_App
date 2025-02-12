import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import '../viewmodels/quiz_Detailvm.dart';

class QuizDetailScreen extends StatelessWidget {

  String res = "true";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuizDetailViewModel>.reactive(
        viewModelBuilder: () => QuizDetailViewModel(),
        onViewModelReady: (model) => model.Init(),
        builder: (context, model, child) => WillPopScope(
            onWillPop: () async {
             return true;
            },
            child: Scaffold(
                appBar: AppBar(
                  title: Center(
                      child: Text(
                    "Quiz Test Detail",
                    style: TextStyle(fontSize: 20),
                  )),
                ),
                body: ListView.builder(
                  itemCount: model.quizDetailList.length,
                  itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 370,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        child: Container(
                            padding: EdgeInsets.only(right: 15, top: 15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(10)),
                            height: 80,
                            child: Column(children: [
                              Text(
                                model.quizDetailList[index].Title,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6,right: 100),
                                child: Text(
                                 "1: "+ model.quizDetailList[index].Options[0].Title,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),Padding(
                                padding: const EdgeInsets.only(top: 6,right: 100),
                                child: Text(
                                  "2: "+model.quizDetailList[index].Options[1].Title,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),Padding(
                                padding: const EdgeInsets.only(top: 6,right: 100),
                                child: Text(
                                  "3: "+model.quizDetailList[index].Options[2].Title,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),Padding(
                                padding: const EdgeInsets.only(top: 6,right: 100),
                                child: Text(
                                  "4: "+model.quizDetailList[index].Options[3].Title,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: model.quizDetailList[index].SelectOption>0
                                ? Text(
                                    "YOU ATTEMPTED  QUESTION!",style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                                )
                                    : Text(
                                  " YOU SKIPPED THIS QUESTION!",style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                )

                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: model.quizDetailList[index].SelectOption>0
                                ? Text(
                                  "You selected : " + model.quizDetailList[index].Options[model.quizDetailList[index].SelectOption-1].Title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ):
                                    Container(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child:
                                model.quizDetailList[index].SelectOption>0
                                    ?
                                Text(
                                  "Your Answer is : " + (model.quizDetailList[index].IsCorrect ? "TRUE" : "WRONG"),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ):
                                    Container(),
                              ),
                              Container(
                                child:model.quizDetailList[index].SelectOption >0 ? Row(
                                  children: [
                                    if(model.quizDetailList[index].IsCorrect== true)...[
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20, left:10,right: 25),
                                         child:Icon(Icons.done_outline,size: 50,color: Colors.green,),
                                      ),
                                    ] else ...[
                                       Padding(
                                         padding: const EdgeInsets.all(10.0),
                                         child: Icon(Icons.close_outlined,size: 50, color: Colors.red,),
                                       ),
                                  ]
                                ]):
                                    Container(),
                              ),

                            ]

                            )
                        ),
                      );
                  },


                )
            )
        )
    );
  }
}
