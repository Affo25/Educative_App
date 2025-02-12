import 'dart:async';

import 'package:educative_app/models/Question.dart';
import '../app/app.locator.dart';
import '../app/app.router.dart';
import '../models/resultdetail.dart';
import '../services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../models/Result.dart';
import '../app/globals.dart';

class QuizViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _apiService = locator<ApiService>();
  late final Timer timerCountdown;
  int counter = 0;

  bool _hideTimer = false;
  bool get HideTimer => _hideTimer;

  List<ResultDetail> qList = [];
  int get counterValue => counter;
  bool timerStarted = false;
  late Question question;
  int selectedOption = -1;
  List<Question> questionList = [];
  int currentIndex = 0;
  int score = 0;
   String title = "";
  String get currentQ => title;

  String opt1 = "";
  String get option1 => opt1;

  String opt2 = "";
  String get option2 => opt2;

  String opt3 = "";
  String get option3 => opt3;

  String opt4 = "";
  String get option4 => opt4;

  String qheading = "";
  String get questionHeader => qheading;
  String subname = "";
  String get SubName => subname;
  int UserID = 0;


  void Init() async{
    setBusy(true);
    try
    {
      UserID = globals.currentUser!.UserID;
      subname = globals.SubName;
      var resultData = await _apiService.getQuestions(globals.CatId, globals.SubId);
      print("questions status => " + resultData.Status);
      var result = resultData.Data as List;
      for (var json in result) {
        questionList.add(Question.fromJson(json));
      }
      print(questionList);
    }
    catch(e)
    {
      print(e.toString());
    }
    setBusy(false);
    LoadQuestion();
  }
 void LoadQuestion(){
   if(questionList.isNotEmpty) {
     question = questionList[currentIndex];
     title = question.Title;
     opt1 = question.Options[0].Title;
     opt2 = question.Options[1].Title;
     if(question.Options.length>2) {
       opt3 = question.Options[2].Title;
     }
     else{
       opt3 = "";
     }
     if(question.Options.length>3) {
       opt4 = question.Options[3].Title;
     } else{
       opt4 = "";
     }

     counter = 0;
     if(globals.examMode=="Test Mode")
       {
         if(!timerStarted) {
           startTimer();
         }
       }
     else{
       _hideTimer = true;
     }
   }
   qheading = "Question ${currentIndex+1}/${questionList.length}";
   selectedOption = -1;
   notifyListeners();
 }
 void selectOption(int index)
 {
   selectedOption = index;
   notifyListeners();
 }
 void loadNext() async {
    if(selectedOption>=0)
      {
        bool correct = false;
        if(question.Options[selectedOption].IsCorrect)
        {
          score += question.Score;
          correct =true;
        }
        qList.add(ResultDetail(0, UserID, question.QuesID, selectedOption+1, correct, 10, 0));
      }
    else{
      qList.add(ResultDetail(0, UserID, question.QuesID, 0, false, 10, 0));
    }
    currentIndex++;
    if(currentIndex<questionList.length)
      {
        LoadQuestion();
      }
    else{
      // fill data
      if(timerStarted) {
        timerCountdown.cancel();
      }
      if(qList.isNotEmpty)
        {
          Map<String,dynamic> udata = <String,dynamic>{};
          udata['UserID'] = UserID;
          udata['CatID'] = globals.CatId;
          udata['SubID'] = globals.SubId;
          udata['Score'] = score;
          udata['Answers'] = qList;
         var resp = await _apiService.uploadData(udata);
          if(resp.Status == "OK")
          {

            var result = resp.Data as List;
            for (var json in result) {
             var currentResult = Result.fromJson(json);
             if(currentResult.UserID>0){
               globals.ResID = currentResult.ResID;
             }
             break;
            }
            qList.clear();
            // show score on next screen
            _navigationService.replaceWith(Routes.resultdetailview);
          }
          else{
            // show error snackbar
          }
        }

    }
    notifyListeners();
 }
  void gotoQuestions(int subId)
  {
    globals.SubId = subId;
    _navigationService.navigateTo(Routes.quizview);
  }
  void startTimer()
  {

    timerStarted = true;
    timerCountdown = Timer.periodic(const Duration(seconds: 1), (timer) {
      counter++;
      print('timer$counter');
      if (counter == 10) {
        print('Cancel timer');
        //timerCountdown.cancel();
        //timerStarted = false;
        counter=0;
        loadNext();
      }
      // lets see k we need notify or not
      notifyListeners();
    });
  }
     void gotodashboard(){
       _navigationService.navigateTo(Routes.dashboardView);
     }
  void gotoreport(){
    _navigationService.navigateTo(Routes.reportquestionview);
  }
  void gotofeedback(){
    _navigationService.navigateTo(Routes.feedbackview);
  }
  void gotoquestion(){
    _navigationService.navigateTo(Routes.quesview);
  }

}