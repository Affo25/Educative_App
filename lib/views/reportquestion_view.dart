import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../app_theme.dart';
import '../flutx/lib/widgets/button/button.dart';
import '../theme/custom_theme.dart';
import '../viewmodels/question_vm.dart';
import '../viewmodels/report_vm.dart';

class ReportQuestionScreen extends StatelessWidget{
  final ThemeData themeData = AppTheme.theme;
  final CustomTheme customTheme = AppTheme.customTheme;
  final reportCtrl = TextEditingController();
  int selectType = 0;
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
                    "Report Question", style: TextStyle(color: Colors.white,fontSize: 20),)),
              body: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 180,top: 17,left: 1),
                    child: Text("Select Report Type",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 130),
                    child: DropdownButton<String>(
                      isExpanded: false,
                      menuMaxHeight: 200,
                      items: model.reporttypeList.map((
                          option) {
                        return DropdownMenuItem<String>(
                          value: option.toString(),
                          child: Text(option.toString()),
                        );
                      }).toList(),
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),
                      hint: const Text("select option"),
                      onChanged: (option) => {
                        print(option),
                        selectType = int.parse(option!)
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 230,top: 10),
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
                        controller: reportCtrl,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 25,right: 25),
                    child: FxButton.block(
                        borderRadiusAll: 8,
                        onPressed: () {
                      model.SendReport(reportCtrl.text,selectType.toString());
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