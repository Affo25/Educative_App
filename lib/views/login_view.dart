import 'package:educative_app/constants/styles.dart';
import 'package:educative_app/viewmodels/login_ViewModel.dart';
import 'package:educative_app/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:educative_app/app_theme.dart';
import '../theme/custom_theme.dart';
import '../utils/spacing.dart';
import '../widgets/button/button.dart';
import '../widgets/text/text.dart';
import '../widgets/text_field/text_field.dart';
class LoginView extends StatefulWidget {

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ),
              FxSpacing.height(24),
              FxTextField(
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
              ),
              FxSpacing.height(16),
              Align(
                alignment: Alignment.centerRight,
                child: FxButton.text(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginView()),
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
    );
  }
}

