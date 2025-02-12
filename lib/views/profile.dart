import 'package:educative_app/app_theme.dart';
import 'package:educative_app/views/aboutapp_view.dart';
import 'package:educative_app/views/account_settingview.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:educative_app/app/app.locator.dart';
import 'package:educative_app/app/app.router.dart';
import 'package:educative_app/services/database_service.dart';
import '../viewmodels/profile_vm.dart';
import 'helpview.dart';
import 'register_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
class ProfileScreen extends StatelessWidget {
  final _databaseService = locator<DatabaseService>();
  final _navigationService = locator<NavigationService>();
  final ThemeData themeData = AppTheme.theme;
  final CustomTheme customTheme = AppTheme.customTheme;


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: () => ProfileViewModel(),
        onViewModelReady: (model) => model.Init(),
        builder: (context, model, child) =>
        WillPopScope(
            onWillPop: () async {
            return true;
            },
      child:Scaffold(
        body: ListView(
          padding:
          FxSpacing.fromLTRB(20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
          children: <Widget>[
            Column(
              children: <Widget>[
                FxContainer.rounded(
                  paddingAll: 0,
                  width: 80,
                  height: 80,
                  child: Image(
                      image: AssetImage('assets/images/images.png'),
                      fit: BoxFit.fill),
                ),
                FxSpacing.height(8),
                FxText.titleMedium(model.currentUser?.Name ?? "",
                    fontWeight: 600, letterSpacing: 0, color: Colors.black87,),
              ],
            ),
            FxSpacing.height(24),
            Column(
              children: <Widget>[
                GestureDetector(
                  child:  singleOption(
                      iconData: MdiIcons.shapeOutline,
                      option: "Account",
                      navigation: AccountSettingScreen()),
                  onTap: (){
                    _navigationService.navigateTo(Routes.acc_settingview);
                  },
                ),

                Divider(),
                GestureDetector(
                  child:     singleOption(
                      iconData: MdiIcons.faceAgent,
                      option: "Help & Support",
                    ),
                  onTap: (){
                   _navigationService.navigateTo(Routes.helpview);
                  },
                ),

                Divider(),
                GestureDetector(
                  child: singleOption(
                      iconData: MdiIcons.creditCardOutline,
                      option: "About App",
                      navigation: AboutAppScreen()),
                  onTap: (){
                    _navigationService.navigateTo(Routes.about_appview);
                  },
                ),

                Divider(),
                singleOption(
                    iconData: MdiIcons.contentPaste,
                    option: "Notification",
                    navigation: RegisterView()),
                FxSpacing.height(24),
                Center(
                  child: FxButton(
                    elevation: 0,
                    backgroundColor: themeData.colorScheme.primary,
                    borderRadiusAll: 4,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          MdiIcons.logoutVariant,
                          color: themeData.colorScheme.onPrimary,
                          size: 18,
                        ),
                        FxSpacing.width(16),
                        FxText.bodySmall("LOGOUT",
                            letterSpacing: 0.3,
                            fontWeight: 600,
                            color: themeData.colorScheme.onPrimary)
                      ],
                    ),
                    onPressed: () {
                      _databaseService.removeUser();
                      _navigationService.navigateTo(Routes.loginView);
                    },
                  ),
                ),
              ],
            )
          ],
        ))));
  }

  Widget singleOption(
      {IconData? iconData, required String option, Widget? navigation}) {
    return Container(
      padding: FxSpacing.y(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                iconData,
                size: 22,
                color: Colors.black,
              ),
            ),
            FxSpacing.width(16),
            Expanded(
              child: FxText.bodyLarge(option, fontWeight: 600,color: Colors.black87,),
            ),
            Container(
              child: Icon(MdiIcons.chevronRight,
                  size: 22, color: Colors.black),
            ),
          ],
        ),
      );
  }
}
