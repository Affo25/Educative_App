import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color whiteColor = Color(0xFFFAFAFA);
const Color offWhiteColor = Color(0xFFECECEC);
const Color blackColor = Color(0xFF151517);
const Color semiblackColor = Color(0x1F000000);
const Color tealColor = Color(0xFF05D1DC);
const Color orangeColor = Color(0xFF0FFA839);
const Color purpleColor = Color(0xFF3F38A3);
const Color lightGreyColor = Color(0xFFF2F2F2);
const Color greyColor = Color(0xFFA6A6A6);
const Color darkGreyColor = Color(0xFF636366);
const Color redColor = Color(0xFFC30132);
const Color greenColor = Color(0xFF00B96A);
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

TextStyle h1TextStyle(Color color, FontWeight weight) => TextStyle(
  fontWeight: weight,
  fontSize: ScreenUtil().setSp(100),
  color: color,
);

TextStyle h2TextStyle(Color color, FontWeight weight) => TextStyle(
  fontWeight: weight,
  fontSize: ScreenUtil().setSp(62),
  color: color,
);

TextStyle h3TextStyle(Color color, FontWeight weight) => TextStyle(
  fontWeight: weight,
  fontSize: ScreenUtil().setSp(50),
  color: color,
);

TextStyle h4TextStyle(Color color, FontWeight weight) => TextStyle(
  fontWeight: weight,
  fontSize: ScreenUtil().setSp(45),
  color: color,
);

TextStyle h5TextStyle(Color color, FontWeight weight) => TextStyle(
  fontWeight: weight,
  fontSize: ScreenUtil().setSp(40),
  color: color,
);

TextStyle h6TextStyle(Color color, FontWeight weight) => TextStyle(
  fontWeight: weight,
  fontSize: ScreenUtil().setSp(35),
  color: color,
);

TextStyle h7TextStyle(Color color, FontWeight weight) => TextStyle(
  fontWeight: weight,
  fontSize: ScreenUtil().setSp(32),
  color: color,
);

TextStyle linkTextStyle(Color color, FontWeight weight) => TextStyle(
  fontWeight: weight,
  fontSize: ScreenUtil().setSp(40),
  color: color,
  decoration: TextDecoration.underline,
);

TextStyle buttonTextStyle(Color color, FontWeight weight) => TextStyle(
  fontWeight: weight,
  fontSize: ScreenUtil().setSp(40),
  color: color,
  decoration: TextDecoration.underline,
);

EdgeInsets scaffoldPadding(BuildContext context) => EdgeInsets.only(
  left: screenWidth(context) * 0.1,
  top: screenHeight(context) * 0.06,
  right: screenWidth(context) * 0.1,
);

BorderRadiusGeometry primaryButtonRadius = BorderRadius.all(
  Radius.circular(50),
);
BorderRadiusGeometry secondaryButtonRadius = BorderRadius.all(
  Radius.circular(10),
);

Widget smallHorizontalSpace = SizedBox(width: ScreenUtil().setWidth(10));
Widget mediumHorizontalSpace = SizedBox(width: ScreenUtil().setWidth(30));
Widget largeHorizontalSpace = SizedBox(width: ScreenUtil().setWidth(50));

Widget smallVerticalSpace = SizedBox(height: ScreenUtil().setHeight(10));
Widget mediumVerticalSpace = SizedBox(height: ScreenUtil().setHeight(30));
Widget largeVerticalSpace = SizedBox(height: ScreenUtil().setHeight(50));
Widget massiveVerticalSpace = SizedBox(height: ScreenUtil().setHeight(60));

double onboardingPadding(BuildContext context) => screenWidth(context) * 0.06;
double appBarPadding(BuildContext context) => screenWidth(context) * 0.02;
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double profileRatingFontSize = ScreenUtil().setSp(55);
double postRatingFontSize = ScreenUtil().setSp(48);
double mainRatingFontSize = ScreenUtil().setSp(120);

bool keyboardIsOpened(context) =>
    MediaQuery.of(context).viewInsets.bottom != 0.0;

double buttonHeight = ScreenUtil().setHeight(150);
double halfButtonWidth = ScreenUtil().setWidth(420);
double postGridAspectRatio = postWidth / postHeight;
double calculatorButtonWidth = ScreenUtil().setWidth(250);
double calculatorButtonHeight = ScreenUtil().setHeight(250);
double calculatorTextFieldHeight = ScreenUtil().setHeight(200);
double postHeight = ScreenUtil().setHeight(700);
double postWidth = ScreenUtil().setWidth(475);
double postDetailHeight = ScreenUtil().setHeight(900);
double postSellerProfileImage = ScreenUtil().setWidth(170);
double navIconSize = 30;
double settingsIconSize = 18;
double logoHeight = ScreenUtil().setHeight(450);
double logoWidth = ScreenUtil().setWidth(450);
double preloaderHeightWidth = ScreenUtil().setWidth(230);
double profileImageHeightWidth = ScreenUtil().setWidth(100);
