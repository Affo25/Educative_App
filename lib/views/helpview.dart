
import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help & Support", style: TextStyle(
            fontSize: 15,
            color: Colors.white
        ),
        ),
      ),
      body: AlertDialog(
           title: Center(
             child: Column(
               children: [
                 Container(
                   padding: EdgeInsets.only(bottom: 25,right: 100),
                   child: Text("Educative App",style: TextStyle(
                     fontSize: 20,
                     color: Colors.black
                   ),
                   ),
                 ),
               ],
             ),
           ),
            content: Column(
              children: [
                const Text("Educative app is the best platform for students,"
                    " who wants to prepare for their test in particular Institute"
                  "Our App is also provided Multiple Tests at one place"
                  ,
                  style: TextStyle(
                  fontSize: 15
                ),
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 30),
                        child: Text("For More Queries & Help ! Please Email us at:",
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),))
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20,right: 16),
                            child: const Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                children: [
                                  WidgetSpan(child: Icon(Icons.mail_lock_sharp,color: Colors.blue, size: 20,)),
                                  TextSpan(
                                    text:  'aridlahore78@gmail.com',style: TextStyle(fontSize: 20))
                                ]
                              ),
                            ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 40),
                        child: Text("Thank You !",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Icon(Icons.thumb_up,size: 50, color: Colors.red,)
                    ),
                  ],
                ),
              ],
            ),
          ),
      );

  }
}