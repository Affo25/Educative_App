import 'package:educative_app/app_theme.dart';
import 'package:educative_app/viewmodels/dashboard_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:educative_app/views/full_app.dart';
import 'package:stacked/stacked.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SubCatScreen extends StatelessWidget {
  final ThemeData themeData = AppTheme.theme;
  final CustomTheme customTheme = AppTheme.customTheme;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      onViewModelReady: (model) => model.Init(),
      builder: (context, model, child) =>
          WillPopScope(
              onWillPop: () {
                return Future(
                      () => true,
                );
              },
              child: Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    centerTitle: true,
                    title: FxText.titleMedium("SubCategories", fontWeight: 600),
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
                  body: Container(
                    child: ListView.builder(
                        itemCount: model.categoryList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return singleTask(
                              image: 'assets/images/afaq.jpg',
                              Title: model.categoryList[index].Title);
                        }),
                  )
              )
          ),
    );
  }

  Widget singleTask({String? Title, String? image}) {

    return FxContainer.bordered(
      paddingAll: 5,
      margin: FxSpacing.fromLTRB(24, 8, 24, 8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            // onTap: ()=>{
            //   model.
            // },
            child: Container(
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
                    margin: FxSpacing.left(180),
                    height: 50,
                    alignment: Alignment.centerLeft,
                    child: FxText.bodyLarge(Title!,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}