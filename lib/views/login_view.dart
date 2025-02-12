import 'package:educative_app/viewmodels/login_vm.dart';
import 'package:educative_app/views/register_view.dart';
import 'package:educative_app/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:educative_app/app_theme.dart';
import '../flutx/lib/icons/two_tone/two_tone_icon.dart';
import '../theme/custom_theme.dart';
import '../utils/spacing.dart';
import '../widgets/button/button.dart';
import '../widgets/text/text.dart';
import '../widgets/text_field/text_field.dart';

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
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          body: ListView(
            padding: FxSpacing.fromLTRB(24, 100, 24, 0),
            children: [
              FxTwoToneIcon(
                FxTwoToneMdiIcons.menu_book,
                color: customTheme.medicarePrimary,
                size: 64,
              ),
              FxSpacing.height(16),
              Center(
                child: FxText.headlineSmall("Log In",
                    color: customTheme.medicarePrimary, fontWeight: 800),
              ),
              FxSpacing.height(32),
              FxTextField(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                autoFocusedBorder: true,
                textFieldStyle: FxTextFieldStyle.outlined,
                textFieldType: FxTextFieldType.email,
                filled: true,
                fillColor: customTheme.medicarePrimary.withAlpha(40),
                enabledBorderColor: customTheme.medicarePrimary,
                focusedBorderColor: customTheme.medicarePrimary,
                prefixIconColor: customTheme.medicarePrimary,
                labelTextColor: customTheme.medicarePrimary,
                cursorColor: customTheme.medicarePrimary,
                controller: emailCtrl,
              ),
              FxSpacing.height(24),
              FxTextField(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                autoFocusedBorder: true,
                textFieldStyle: FxTextFieldStyle.outlined,
                textFieldType: FxTextFieldType.password,
                filled: true,
                fillColor: customTheme.medicarePrimary.withAlpha(40),
                enabledBorderColor: customTheme.medicarePrimary,
                focusedBorderColor: customTheme.medicarePrimary,
                prefixIconColor: customTheme.medicarePrimary,
                labelTextColor: customTheme.medicarePrimary,
                cursorColor: customTheme.medicarePrimary,
                controller: passwordCtrl,
              ),
              FxSpacing.height(16),
              Align(
                alignment: Alignment.centerRight,
                child: FxButton.text(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) => SplashView()),
                      );
                    },
                    padding: FxSpacing.zero,
                    splashColor: customTheme.medicarePrimary.withAlpha(40),
                    child: FxText.labelMedium("Forgot Password?",
                        color: customTheme.medicarePrimary)),
              ),
              FxSpacing.height(16),
              FxButton.block(
                  borderRadiusAll: 8,
                  onPressed: () {
                    if (emailCtrl.text.isEmpty) {
                      model.showMessage("username");
                      return;
                    } else if (passwordCtrl.text.isEmpty) {
                      model.showMessage("password");
                      return;
                    }
                    model.login( emailCtrl.text,passwordCtrl.text);
                  },
                  backgroundColor: customTheme.medicarePrimary,
                  child: FxText.labelLarge(
                    "Log In",
                    color:  customTheme.medicareOnPrimary,
                  )),
              FxSpacing.height(16),
              FxButton.text(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) => RegisterView()),
                    );
                  },
                  splashColor: customTheme.medicarePrimary.withAlpha(40),
                  child: FxText.labelMedium("I haven't an account",
                      decoration: TextDecoration.underline,
                      color: customTheme.medicarePrimary))
            ],
          ),
        ),
    ),
    );
  }
}

