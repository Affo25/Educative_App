import 'package:educative_app/app_theme.dart';
import 'package:educative_app/viewmodels/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:educative_app/views/full_app.dart';
import 'package:stacked/stacked.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
              onWillPop: () {
                return Future(
                      () => false,
                );
              },
              child: Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    title: FxText.bodyLarge("Choose Test Type",
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                  ),
                  body: ListView(
                    padding: FxSpacing.zero,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: FxSpacing.top(8),
                            child: ListView.builder(
                                itemCount: model.categoryList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return singleTask(
                                      image: 'assets/images/afaq.jpg',
                                      Title: model.categoryList[index].Title);
                                }),
                          ),
                        ],
                      )
                    ],
                  ))),
    );
  }

  Widget singleTask({String? Title, String? image, int status = 0}) {
    IconData iconData;
    Color iconBG, iconColor, statusColor;
    switch (status) {
      case 0:
        iconBG = customTheme.colorError;
        iconColor = customTheme.onError;
        iconData = MdiIcons.plus;
        statusColor = customTheme.colorError;
        break;
      case 1:
        iconBG = themeData.colorScheme.primary;
        iconColor = themeData.colorScheme.onPrimary;
        iconData = MdiIcons.plus;
        statusColor = themeData.colorScheme.primary;
        break;
      case 2:
        iconBG = customTheme.colorInfo;
        iconColor = customTheme.onInfo;
        iconData = MdiIcons.pencilOutline;
        statusColor = customTheme.colorInfo;
        break;
      case 3:
        iconBG = customTheme.disabledColor;
        iconColor = customTheme.onDisabled;
        iconData = MdiIcons.spellcheck;
        statusColor = customTheme.disabledColor;
        break;
      default:
        iconBG = customTheme.colorError;
        iconColor = customTheme.onError;
        iconData = MdiIcons.plus;
        statusColor = customTheme.colorError;
        break;
    }

    return FxContainer.bordered(
      paddingAll: 16,
      margin: FxSpacing.fromLTRB(24, 8, 24, 8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: FxSpacing.all(6),
            decoration: BoxDecoration(color: iconBG, shape: BoxShape.circle),
            child: Icon(
              iconData,
              color: iconColor,
              size: 20,
            ),
          ),
          Expanded(
            child: Container(
              margin: FxSpacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.bodyLarge(Title!,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                  Container(
                    margin: FxSpacing.all(5),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        child: Image(
                          image: AssetImage(image!),
                          alignment: Alignment.topLeft,
                          height: 44,
                          width: 44,
                        )),
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