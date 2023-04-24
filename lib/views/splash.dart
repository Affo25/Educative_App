
import 'package:educative_app/widgets/button/button.dart';
import 'package:educative_app/widgets/text/text.dart';
import 'package:educative_app/viewmodels/splashViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:educative_app/theme/custom_theme.dart';
import 'package:educative_app/views/login_view.dart';
import '../theme/text_style.dart';
import '../utils/spacing.dart';
import 'package:educative_app/app_theme.dart';
import 'package:educative_app/views/register_view.dart';




class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late ThemeData theme;
  late CustomTheme customTheme;


  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    FxTextStyle.changeDefaultFontWeight({
      100: FontWeight.w200,
      200: FontWeight.w300,
      300: FontWeight.w400,
      400: FontWeight.w500,
      500: FontWeight.w600,
      600: FontWeight.w700,
      700: FontWeight.w800,
      800: FontWeight.w900,
      900: FontWeight.w900,
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashVModel>.reactive(
        viewModelBuilder: () => SplashVModel(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => WillPopScope(
            onWillPop: () {
              return Future(
                    () => false,
              );
            },
      child: Scaffold(
        body: Container(
          margin: FxSpacing.fromLTRB(24, 100, 24, 32),
          child: Column(
            children: [
              FxText.displaySmall(
                "Welcome to Educative App",
                color: Colors.blue,
              ),
              const Expanded(
                child: Center(
                  child: Image(
                    image: AssetImage(
                        'assets/images/splashScreen.png'),
                    width: 320,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: FxButton.text(
                        splashColor: customTheme.medicarePrimary.withAlpha(40),
                        padding: FxSpacing.y(12),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => RegisterView()),
                          );
                        },

                        child: FxText.labelLarge(
                          "SIGN UP",
                          color: customTheme.medicarePrimary,
                          letterSpacing: 0.5,
                        ),
                      )),
                  Expanded(
                      child: FxButton(
                        elevation: 0,
                        padding: FxSpacing.y(12),
                        borderRadiusAll: 4,
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => LoginView()),
                          );
                        },
                        backgroundColor:  customTheme.medicarePrimary,
                        child: FxText.labelLarge(
                          "LOG IN",
                          color:  customTheme.medicareOnPrimary,
                          letterSpacing: 0.5,
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
