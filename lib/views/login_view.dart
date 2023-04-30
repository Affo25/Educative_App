import 'package:educative_app/constants/styles.dart';
import 'package:educative_app/viewmodels/login_ViewModel.dart';
import 'package:educative_app/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:educative_app/app_theme.dart';
import '../theme/custom_theme.dart';
import '../utils/spacing.dart';
import '../widgets/button/button.dart';
import '../widgets/text/text.dart';
import '../widgets/text_field/text_field.dart';
import '../views/full_app.dart';

class LoginView extends StatelessWidget {

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  bool _passwordVisible = false;
  final ThemeData themeData = AppTheme.theme;
  final CustomTheme customTheme = AppTheme.customTheme;



  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => WillPopScope(
          onWillPop: () {
            return Future(
                  () => false,
            );
          },
    child: Scaffold(
      body: Center(
        child: Padding(
          padding: FxSpacing.horizontal(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FxTextField(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                autoFocusedBorder: true,
                textFieldStyle: FxTextFieldStyle.outlined,
                textFieldType: FxTextFieldType.email,
                filled: true,
                fillColor: customTheme.medicarePrimary.withAlpha(50),
                enabledBorderColor: customTheme.medicarePrimary,
                focusedBorderColor: customTheme.medicarePrimary,
                prefixIconColor: customTheme.medicarePrimary,
                labelTextColor: customTheme.medicarePrimary,
                cursorColor: customTheme.medicarePrimary,
                controller: emailCtrl,

        ),
              FxSpacing.height(24),
              FxTextField(
                obscureText: _passwordVisible,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                autoFocusedBorder: true,
                textFieldStyle: FxTextFieldStyle.outlined,
                textFieldType: FxTextFieldType.password,
                filled: true,
                fillColor: customTheme.medicarePrimary.withAlpha(50),
                enabledBorderColor: customTheme.medicarePrimary,
                focusedBorderColor: customTheme.medicarePrimary,
                prefixIconColor: customTheme.medicarePrimary,
                labelTextColor: customTheme.medicarePrimary,
                cursorColor: customTheme.medicarePrimary,
                prefixIcon: Icon(MdiIcons.lockOutline),
                suffixIcon: IconButton(
                  icon: Icon(_passwordVisible
                      ? MdiIcons.eyeOutline
                      : MdiIcons.eyeOffOutline),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),

                controller: passwordCtrl,
      ),
              FxSpacing.height(16),
              Align(
                alignment: Alignment.centerRight,
                child: FxButton.text(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                FullApp()),
                      );
                    },
                    splashColor: customTheme.medicarePrimary.withAlpha(40),
                    child: FxText.bodySmall("Forgot Password?",
                        color: customTheme.medicarePrimary)),
              ),
              FxSpacing.height(16),
              FxButton.block(
                borderRadiusAll: 8,
                elevation: 0,
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
                backgroundColor: customTheme.medicarePrimary,
                child: FxText.labelMedium(
                  "LOG IN",
                  fontWeight: 700,
                  color: customTheme.medicareOnPrimary,
                  letterSpacing: 0.4,
                ),
              ),
              FxSpacing.height(16),
              FxButton.text(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (context) => RegisterView()),
                  );
                },
                splashColor: customTheme.medicarePrimary.withAlpha(40),
                child: FxText.bodySmall("I haven't an account",
                    decoration: TextDecoration.underline,
                    color: customTheme.medicarePrimary),
              ),
            ],
          ),
        ),
      ),
    ),
    ),
    );
  }

  void setState(Null Function() param0) {}


}

