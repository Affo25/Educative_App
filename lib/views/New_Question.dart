  /*
  * File : Register
  * Version : 1.0.0
  * */
  import 'package:educative_app/app_theme.dart';
import 'package:educative_app/extensions/extensions.dart';
import 'package:educative_app/models/Category.dart';
import 'package:educative_app/models/SubCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import '../viewmodels/question_vm.dart';
  class Questionscreen extends StatelessWidget {
    final ThemeData themeData = AppTheme.theme;
    final CustomTheme customTheme = AppTheme.customTheme;
    final TitleCtrl = TextEditingController();
    final Option1Ctrl = TextEditingController();
    final Option2Ctrl = TextEditingController();
    final Option3Ctrl = TextEditingController();
    final Option4Ctrl = TextEditingController();
    late int correctOption= 0;


    @override
    Widget build(BuildContext context) {
      return ViewModelBuilder<QuestionViewModel>.reactive(
        viewModelBuilder: () => QuestionViewModel(),
        onViewModelReady: (model) => model.Init(),
        builder: (context, model, child) =>
            WillPopScope(
              onWillPop: () async {
                return true;
              },

              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: FxText.titleMedium(
                      "Add New Question", fontWeight: 600),
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Colors.blue,
                              Colors.blue
                            ])
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                    child: Column(
                        children: <Widget>[
                          // Container(
                          //   margin: EdgeInsets.only(top: 8,bottom: 10),
                          //   child: FxText.titleMedium("Select Category", fontWeight: 600,color: Colors.black,
                          //   ),
                          // ),
                          Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(top: 1, left: 5, right: 5),
                            child: DropdownButton<String>(
                              isExpanded: false,
                              menuMaxHeight: 200,
                              items: model.categoryList.map((
                                    Category) {
                                return DropdownMenuItem<String>(
                                  value: Category.CatID.toString(),
                                  child: Text(Category.Title),
                                );
                              }).toList(),
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black
                              ),
                              hint: Text("select Category"),
                              onChanged: (catID) => {
                                model.LoadSubcategories( int.parse(catID.toString()))
                              },
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: 10, left: 5, right: 5, bottom: 10),
                            child: DropdownButton<String>(
                              isExpanded: false,
                              menuMaxHeight: 200,
                              items: model.subList.map((sub) {
                                return DropdownMenuItem<String>(
                                  value: sub.SubID.toString(),
                                  child: Text(sub.Name),
                                );
                              }).toList(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              hint: Text("select SubCategory"),
                              onChanged: (value) => {
                                model.SetSubId(int.parse(value.toString()))
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 1, right: 1, top: 2, bottom: 60),
                            child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 10, left: 5, right: 5),
                                    child: TextFormField(
                                      style: FxTextStyle.bodyLarge(
                                          color: Colors.black,
                                          fontWeight: 500),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.black,
                                          ),
                                        ),
                                        hintText: "Enter Title",
                                        hintStyle: FxTextStyle.bodyLarge(
                                            color: Colors.black,
                                            fontWeight: 500),
                                        prefixIcon: Icon(MdiIcons.quora),
                                      ),
                                      textCapitalization: TextCapitalization
                                          .sentences,
                                      controller: TitleCtrl,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 10, left: 5, right: 5),
                                    child: TextFormField(
                                      style: FxTextStyle.bodyLarge(
                                          color: Colors.black,
                                          fontWeight: 500),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.black,
                                          ),
                                        ),
                                        hintText: "Enter Option 1",
                                        hintStyle: FxTextStyle.bodyLarge(
                                            color: Colors.black,
                                            fontWeight: 500),
                                        prefixIcon: Icon(MdiIcons.plusCircle),
                                      ),
                                      textCapitalization: TextCapitalization
                                          .sentences,
                                      controller: Option1Ctrl,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 10, left: 5, right: 5),
                                    child: TextFormField(
                                      style: FxTextStyle.bodyLarge(
                                          color: Colors.black,
                                          fontWeight: 500),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.black,
                                          ),
                                        ),
                                        hintText: "Enter Option2",
                                        hintStyle: FxTextStyle.bodyLarge(
                                            color: Colors.black,
                                            fontWeight: 500),
                                        prefixIcon: Icon(MdiIcons.plusCircle),
                                      ),
                                      textCapitalization: TextCapitalization
                                          .sentences,
                                      controller: Option2Ctrl,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 10, left: 5, right: 5),
                                    child: TextFormField(
                                      style: FxTextStyle.bodyLarge(
                                          color: Colors.black,
                                          fontWeight: 500),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.black,
                                          ),
                                        ),
                                        hintText: "Enter Option 3",
                                        hintStyle: FxTextStyle.bodyLarge(
                                            color: Colors.black,
                                            fontWeight: 500),
                                        prefixIcon: Icon(MdiIcons.plusCircle),
                                      ),
                                      textCapitalization: TextCapitalization
                                          .sentences,
                                      controller: Option3Ctrl,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 10, left: 5, right: 5),
                                    child: TextFormField(
                                      style: FxTextStyle.bodyLarge(
                                          color: Colors.black,
                                          fontWeight: 500),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.black,
                                          ),
                                        ),
                                        hintText: "Enter Option 4",
                                        hintStyle: FxTextStyle.bodyLarge(
                                            color: Colors.black,
                                            fontWeight: 500),
                                        prefixIcon: Icon(MdiIcons.plusCircle),
                                      ),
                                      textCapitalization: TextCapitalization
                                          .sentences,
                                      controller: Option4Ctrl,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        top: 10, left: 5, right: 5, bottom: 10),
                                    child: DropdownButton<String>(
                                      isExpanded: false,
                                      menuMaxHeight: 200,
                                      items: model.optionList.map((
                                          option) {
                                        return DropdownMenuItem<String>(
                                          value: option.toString(),
                                          child: Text(option.toString()),
                                        );
                                      }).toList(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black
                                      ),
                                      hint: Text("select correct option"),
                                      onChanged: (option) => {
                                        print(option),
                                        correctOption = int.parse(option!)
                                      },
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: 24, left: 5, right: 5),
                                      child: FxButton.block(
                                          elevation: 10,
                                          borderRadiusAll: 4,
                                          onPressed: () {
                                            model.AddNewQuestion(TitleCtrl.text, Option1Ctrl.text, Option2Ctrl.text, Option3Ctrl.text, Option4Ctrl.text, correctOption);
                                          },
                                          child: FxText.labelMedium("SAVE",
                                              fontWeight: 600,
                                              color: themeData.colorScheme
                                                  .onPrimary))),
                                ]),
                          ),
                        ])
                ),
              ),
            ),
      );
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
