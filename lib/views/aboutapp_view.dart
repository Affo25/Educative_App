
import 'package:flutter/material.dart';


class AboutAppScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Center(
        child: Text("About App",
          style: TextStyle(
              fontSize: 18,color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    body: ListView(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20,right: 200,top: 30),
              child: const Text("About this App",style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10,top: 20,right: 10),
                  child: const Text("NTS MCQs Test App is one of the best app for NTS test preparation 2023. "
                      "It provides NTS free online MCQs, Notes. "
                      "NTS(National Testing Service) exams test contains 30+ categories of NTS questions and answers ranging from pedagogy, "
                      "psychology, general knowledge, current affair to english preparation and science subjects. Now no need to buy books for nts test preparation. "
                      "After you get nts registration form and roll no slip, you get nts date sheet or schedule then you can start preparing test for government job or private. "
                      "NTS test preparation Book gives you an insight on how to prepare for this NTS, GAT test and prepare for nts interview as well. "
                      "This app is also helpful for NTS AJK, NTS entry test, bts, pts, wapda test, nts iq, driver test, educators pedagogy."
                      "Our App also many type of Test Contain.\n",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 30),
                      child: const Text("Our App Covers Different Exams Type",style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(padding: const EdgeInsets.only(right: 165,left: 10),
                          child: const Text("- NTS NAT(National Aptitude Test)-I"
                              "- NTS NAT-II \n"
                              "- NTS GAT (Graduate Assessment Test) General \n"
                              "- NTS GAT Subject \n"
                              "- NTS GAT LAW",style: TextStyle(
                            fontSize: 13,
                          ),),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 30),
                      child: const Text("Add New Question",style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(padding: const EdgeInsets.only(right: 165,left: 10),
                          child: const Text("-If you have any question that you want to share You can easily share with us by clicking on Add New Question button on Quiz screen"
                              ,style: TextStyle(
                            fontSize: 13,
                          ),),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 30),
                      child: const Text("Statistics ",style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(padding: const EdgeInsets.only(right: 165,left: 10),
                          child: const Text("-One of the interesting feature of NTS MCQs App is its Statistics, "
                              "-which helps students to evaluate their performance after each test with time spent on each level. "
                              "-You can also see the correct, wrong and unanswered questions. "
                              "-The total statistics can be seen by clicking on Statistics button on home screen."
                             ,style: TextStyle(
                            fontSize: 13,
                          ),),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 93),
                      child: const Text("Mock Test MCQs Categories",style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(padding: const EdgeInsets.only(right: 165,left: 10),
                          child: const Text("- NTS NAT(National Aptitude Test)-I"
                              "- Entry Test Type For Education \n"
                              "- PPSC Test Type \n"
                              "- PPFC Test Type \n"
                              "- NTS GAT LAW",style: TextStyle(
                            fontSize: 13,
                          ),),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 240),
                          child: const Text("Education",style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(padding: const EdgeInsets.only(right: 165,left: 10),
                              child: const Text("- NTS Pedagogy"
                                  "- Psychology "
                                ,style: TextStyle(
                                fontSize: 13,
                              ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 230),
                          child: const Text("FEATURES:",style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(padding: const EdgeInsets.only(right: 165,left: 10),
                              child: const Text("- Beautiful UX & UI"
                                  "- Easy to use"
                              "- Category wise selection"
                              "- See your current score"
                                ,style: TextStyle(
                                  fontSize: 14,
                                ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
  }

}