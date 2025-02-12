import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../app_theme.dart';
import '../flutx/lib/widgets/button/button.dart';
import '../theme/custom_theme.dart';
import '../viewmodels/quiz_vm.dart';
import '../viewmodels/report_vm.dart';


class FeedbackScreen extends StatelessWidget{
  final ThemeData themeData = AppTheme.theme;
  final CustomTheme customTheme = AppTheme.customTheme;
  final feedbackCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReportViewModel>.reactive(
        viewModelBuilder: () => ReportViewModel(),
        builder: (context, model, child) =>
            WillPopScope(
                onWillPop: () async {
                  return true;
                },
                child: Scaffold(
                  appBar: AppBar(
                    title:  Text(
                      "FeedBack", style: TextStyle(color: Colors.white,fontSize: 20),)),
                  body: Column(
                    children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Text("Have any suggestion/feedback? You can contact us by\n writing below!",style: TextStyle(color: Colors.black45,fontSize: 12),),
                          ),
                      Container(
                        padding: EdgeInsets.only(right: 250,top: 12),
                        child: Text("FeedBack",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: SizedBox(
                          width: 310,
                          height: 170,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Write FeedBack Here",
                            ),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: 6,
                            controller: feedbackCtrl,
                          ),
                        ),
                        ),
                      Container(
                        padding: EdgeInsets.only(left: 25,right: 25),
                        child: FxButton.block(
                            borderRadiusAll: 8,
                            onPressed: () {
                              model.SendFeedback(feedbackCtrl.text);
                            },
                            backgroundColor: customTheme.medicarePrimary,
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                color:  customTheme.medicareOnPrimary,
                                fontSize: 12
                              ),
                            )),
                      ),
                        ],
                      ),
                  ),
                  ),
                  );
  }
}