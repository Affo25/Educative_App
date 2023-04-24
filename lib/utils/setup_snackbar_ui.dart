
import 'package:educative_app/app/app.locator.dart';
import 'package:educative_app/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked_services/stacked_services.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  service.registerSnackbarConfig(SnackbarConfig(
    maxWidth: 100.0,
    margin: EdgeInsets.all(20),
    backgroundColor: whiteColor,
    textColor: blackColor,
  ));
}
