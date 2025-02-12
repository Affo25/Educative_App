
import 'package:stacked/stacked.dart';
import 'package:educative_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../viewmodels/profile_vm.dart';

class AccountSettingScreen extends StatelessWidget {

  bool _passwordVisible = false;
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
                child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.blue,
                      elevation: 0,
                      leading: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          FeatherIcons.chevronLeft,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      centerTitle: true,
                      title: FxText.titleMedium(
                        "Account Setting", fontWeight: 600,
                        color: Colors.white,),
                    ),
                    body: Card(
                        elevation: 40,
                        shadowColor: Colors.white,
                        child: ListView(
                          padding: FxSpacing.nTop(20),
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: FxText.bodyLarge("Personal information",
                                  color: Colors.black,
                                  fontWeight: 900, letterSpacing: 0),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 50),
                                    child: TextFormField(
                                      style: FxTextStyle.titleSmall(
                                          letterSpacing: 0,
                                          color: themeData.colorScheme.onBackground,
                                          fontWeight: 500),
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle: FxTextStyle.titleSmall(
                                            letterSpacing: 0,
                                            color: themeData.colorScheme
                                                .onBackground,
                                            fontWeight: 500),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(4),
                                            ),
                                            borderSide: BorderSide.none),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(4),
                                            ),
                                            borderSide: BorderSide.none),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(4),
                                            ),
                                            borderSide: BorderSide.none),
                                        filled: true,
                                        fillColor: customTheme.card,
                                        prefixIcon: Icon(
                                          MdiIcons.emailOutline,
                                          size: 22,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(0),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      textCapitalization: TextCapitalization
                                          .sentences,
                                      controller:  model.emailCtrl,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 12),
                                    child: TextFormField(
                                      style: FxTextStyle.titleSmall(
                                          letterSpacing: 0,
                                          color: themeData.colorScheme.onBackground,
                                          fontWeight: 500),
                                      decoration: InputDecoration(
                                        hintText: "Number",
                                        hintStyle: FxTextStyle.titleSmall(
                                            letterSpacing: 0,
                                            color: themeData.colorScheme
                                                .onBackground,
                                            fontWeight: 500),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(4),
                                            ),
                                            borderSide: BorderSide.none),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(4),
                                            ),
                                            borderSide: BorderSide.none),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(4),
                                            ),
                                            borderSide: BorderSide.none),
                                        filled: true,
                                        fillColor: customTheme.card,
                                        prefixIcon: Icon(
                                          MdiIcons.phoneOutline,
                                          size: 22,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(0),
                                      ),
                                      keyboardType: TextInputType.number,
                                      controller: model.phoneNoCtrl,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 16),
                                    child: TextFormField(
                                      style: FxTextStyle.titleSmall(
                                          letterSpacing: 0,
                                          color: themeData.colorScheme.onBackground,
                                          fontWeight: 500),
                                      decoration: InputDecoration(
                                        hintText: "Name",
                                        hintStyle: FxTextStyle.titleSmall(
                                            letterSpacing: 0,
                                            color: themeData.colorScheme
                                                .onBackground,
                                            fontWeight: 500),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(4),
                                            ),
                                            borderSide: BorderSide.none),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(4),
                                            ),
                                            borderSide: BorderSide.none),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(4),
                                            ),
                                            borderSide: BorderSide.none),
                                        filled: true,
                                        fillColor: customTheme.card,
                                        prefixIcon: Icon(
                                          MdiIcons.domain,
                                          size: 22,
                                        ),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(0),
                                      ),
                                      textCapitalization: TextCapitalization
                                          .sentences,
                                      controller: model.nameCtrl,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 12),
                              child: TextFormField(
                                style: FxTextStyle.titleSmall(
                                    letterSpacing: 0,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500),
                                decoration: InputDecoration(
                                  hintText: " Password",
                                  hintStyle: FxTextStyle.titleSmall(
                                      letterSpacing: 0,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 500),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  fillColor: customTheme.card,
                                  prefixIcon: Icon(MdiIcons.lockOutline),
                                  // suffixIcon: IconButton(
                                  //   icon: Icon(_passwordVisible
                                  //       ? MdiIcons.eyeOutline
                                  //       : MdiIcons.eyeOffOutline),
                                  //   onPressed: () {
                                  //     setState(() {
                                  //       _passwordVisible = !_passwordVisible;
                                  //     });
                                  //   },
                                  // ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(0),
                                ),
                                textCapitalization: TextCapitalization.sentences,
                                obscureText: _passwordVisible,
                                controller: model.passwordCtrl,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 24),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(4)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: themeData.colorScheme.primary
                                            .withAlpha(28),
                                        blurRadius: 4,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                       model.Updateuser();
                                      },
                                      style: ButtonStyle(
                                          padding:
                                          MaterialStateProperty.all(FxSpacing.xy(
                                              16, 0))),
                                      child: FxText.bodyLarge("SAVE",
                                          fontWeight: 600,
                                          color: themeData.colorScheme.onPrimary),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    )));
  }

}
