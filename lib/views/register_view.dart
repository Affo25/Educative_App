import 'package:educative_app/app_theme.dart';
import 'package:educative_app/views/login_view.dart';
 import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import '../utils/spacing.dart';
import '../viewmodels/register_ViewModel.dart';
import 'package:educative_app/widgets/text_field/text_field.dart';

import '../widgets/button/button.dart';
import '../widgets/text/text.dart';


class RegisterView extends StatelessWidget {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final genderCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final phoneNoCtrl = TextEditingController();


  final ThemeData themeData = AppTheme.theme;
  final CustomTheme customTheme = AppTheme.customTheme;
  bool showHiddenpassword = true;




   @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (context, model, child) => WillPopScope(
        onWillPop: () {
          return Future(
            () => false,
          );
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: FxSpacing.horizontal(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FxTextField(

                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  autoFocusedBorder: true,
                  textFieldStyle: FxTextFieldStyle.outlined,
                  textFieldType: FxTextFieldType.name,
                  filled: true,
                  fillColor: customTheme.medicarePrimary.withAlpha(40),
                  enabledBorderColor: customTheme.medicarePrimary,
                  focusedBorderColor: customTheme.medicarePrimary,
                  prefixIconColor: customTheme.medicarePrimary,
                  labelTextColor: customTheme.medicarePrimary,
                  cursorColor: customTheme.medicarePrimary,
                  controller: nameCtrl,
                ),
                FxSpacing.height(20),
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
                FxSpacing.height(20),
                FxTextField(
                  obscureText: showHiddenpassword,
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
                   suffixIcon: InkWell(
                    //onTap: buildPasswordField,
                       child: Icon(Icons.visibility)),


                  controller: passwordCtrl,
                ),
                FxSpacing.height(20),
                FxTextField(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  autoFocusedBorder: true,
                  textFieldStyle: FxTextFieldStyle.outlined,
                  textFieldType: FxTextFieldType.gender,
                  filled: true,
                  fillColor: customTheme.medicarePrimary.withAlpha(40),
                  enabledBorderColor: customTheme.medicarePrimary,
                  focusedBorderColor: customTheme.medicarePrimary,
                  prefixIconColor: customTheme.medicarePrimary,
                  labelTextColor: customTheme.medicarePrimary,
                  cursorColor: customTheme.medicarePrimary,
                  controller: genderCtrl,
                ),
                FxSpacing.height(20),
                FxTextField(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  autoFocusedBorder: true,
                  textFieldStyle: FxTextFieldStyle.outlined,
                  textFieldType: FxTextFieldType.age,
                  filled: true,
                  fillColor: customTheme.medicarePrimary.withAlpha(40),
                  enabledBorderColor: customTheme.medicarePrimary,
                  focusedBorderColor: customTheme.medicarePrimary,
                  prefixIconColor: customTheme.medicarePrimary,
                  labelTextColor: customTheme.medicarePrimary,
                  cursorColor: customTheme.medicarePrimary,
                  controller: ageCtrl,
                ),
                FxSpacing.height(20),
                FxTextField(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  autoFocusedBorder: true,
                  textFieldStyle: FxTextFieldStyle.outlined,
                  textFieldType: FxTextFieldType.mobileNumber,
                  filled: true,
                  fillColor: customTheme.medicarePrimary.withAlpha(40),
                  enabledBorderColor: customTheme.medicarePrimary,
                  focusedBorderColor: customTheme.medicarePrimary,
                  prefixIconColor: customTheme.medicarePrimary,
                  labelTextColor: customTheme.medicarePrimary,
                  cursorColor: customTheme.medicarePrimary,
                  controller: phoneNoCtrl,
                ),
                FxSpacing.height(16),
                Align(
                  alignment: Alignment.centerRight,
                  child: FxButton.text(
                      padding: FxSpacing.zero,
                      onPressed: () {
                        // Navigator.of(context, rootNavigator: true).push(
                        //   MaterialPageRoute(
                        //       builder: (context) => RegistrationView()),
                        // );
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
                         MaterialPageRoute(builder: (context) => RegisterView()),
                        );
                      model.createNewUser(nameCtrl.text, emailCtrl.text,genderCtrl.text,passwordCtrl.text,phoneNoCtrl.text);
                    },
                    backgroundColor: customTheme.medicarePrimary,
                    child: FxText.bodyLarge(
                      "Create an Account",
                      color: customTheme.medicareOnPrimary,
                    )),
                FxSpacing.height(16),
                FxButton.text(
                    onPressed: () {

                       Navigator.of(context, rootNavigator: true).push(
                         MaterialPageRoute(
                             builder: (context) => LoginView()),
                       );
                    },
                    splashColor: customTheme.medicarePrimary.withAlpha(40),
                    child: FxText.bodySmall("I have already an account",
                        decoration: TextDecoration.underline,
                        color: customTheme.medicarePrimary)),
              ],
            ),
          ),
        ),
      ),
    );
  }




}

 
