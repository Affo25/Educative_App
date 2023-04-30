/*
* File : Register
* Version : 1.0.0
* */

import 'package:educative_app/app_theme.dart';
import 'package:educative_app/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Questionscreen extends StatefulWidget {
  @override
  _QuestionscreenState createState() => _QuestionscreenState();
}

class _QuestionscreenState extends State<Questionscreen> {
  bool _passwordVisible = false;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            ClipPath(
                clipper: _MyCustomClipper(context),
                child: Container(
                  alignment: Alignment.center,
                  color: theme.colorScheme.background,
                )),
            Positioned(
              left: 10,
              right: 10,
              top: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: <Widget>[
                  FxContainer.bordered(
                    color: theme.scaffoldBackgroundColor,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: FxText.titleLarge("ADD NEW QUESTION", fontWeight: 600,color: Colors.black,),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 1, right: 1, top: 8),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 16),
                                child: TextFormField(
                                  style: FxTextStyle.bodyLarge(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: theme.colorScheme.onBackground
                                      ),
                                    ),
                                    hintText: "Enter Question",
                                    hintStyle: FxTextStyle.bodyLarge(
                                        color: theme.colorScheme.onBackground,
                                        fontWeight: 500),
                                    prefixIcon: Icon(MdiIcons.quora),
                                  ),
                                  textCapitalization: TextCapitalization.sentences,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16),
                                child: TextFormField(
                                  style: FxTextStyle.bodyLarge(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: theme.colorScheme.onBackground
                                      ),
                                    ),
                                    hintText: "Enter Option 1",
                                    hintStyle: FxTextStyle.bodyLarge(
                                        color: theme.colorScheme.onBackground,
                                        fontWeight: 500),
                                    prefixIcon: Icon(MdiIcons.plusCircle),
                                  ),
                                  textCapitalization: TextCapitalization.sentences,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16),
                                child: TextFormField(
                                  style: FxTextStyle.bodyLarge(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: theme.colorScheme.onBackground
                                      ),
                                    ),
                                    hintText: "Enter Option2",
                                    hintStyle: FxTextStyle.bodyLarge(
                                        color: theme.colorScheme.onBackground,
                                        fontWeight: 500),
                                    prefixIcon: Icon(MdiIcons.plusBox),
                                  ),
                                  textCapitalization: TextCapitalization.sentences,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16),
                                child: TextFormField(
                                  style: FxTextStyle.bodyLarge(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: theme.colorScheme.onBackground
                                      ),
                                    ),
                                    hintText: "Enter Option 3",
                                    hintStyle: FxTextStyle.bodyLarge(
                                        color: theme.colorScheme.onBackground,
                                        fontWeight: 500),
                                    prefixIcon: Icon(MdiIcons.plusCircle),
                                  ),
                                  textCapitalization: TextCapitalization.sentences,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16),
                                child: TextFormField(
                                  style: FxTextStyle.bodyLarge(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: theme.colorScheme.onBackground
                                      ),
                                    ),
                                    hintText: "Enter Option 4",
                                    hintStyle: FxTextStyle.bodyLarge(
                                        color: theme.colorScheme.onBackground,
                                        fontWeight: 500),
                                    prefixIcon: Icon(MdiIcons.plusCircle),
                                  ),
                                  textCapitalization: TextCapitalization.sentences,
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 24),
                                  child: FxButton.block(
                                      elevation: 10,
                                      borderRadiusAll: 4,
                                      onPressed: () {},
                                      child: FxText.labelMedium("SAVE",
                                          fontWeight: 600,
                                          color: theme.colorScheme.onPrimary))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pushReplacement(context,
                  //         MaterialPageRoute(builder: (context) => LoginView()));
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.only(top: 16, bottom: 8),
                  //     child: RichText(
                  //       text: TextSpan(children: <TextSpan>[
                  //         TextSpan(
                  //             text: "I've already an Account? ",
                  //             style: FxTextStyle.bodyMedium(fontWeight: 500,color: Colors.black)),
                  //
                  //         TextSpan(
                  //             text: " Login",
                  //             style: FxTextStyle.bodyMedium(
                  //                 fontWeight: 600,
                  //                 color: theme.colorScheme.primary)),
                  //       ]),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            Positioned(
              top: FxSpacing.safeAreaTop(context) + 12,
              left: 16,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  FeatherIcons.chevronLeft,
                  color: theme.colorScheme.onBackground,
                ),
              ),
            )
          ],
        ));
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  final BuildContext _context;

  _MyCustomClipper(this._context);

  @override
  Path getClip(Size size) {
    final path = Path();
    Size size = MediaQuery.of(_context).size;
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(0, size.height * 0.6);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
