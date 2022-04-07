import 'package:flutter/material.dart';
import 'package:workshop/pages/alertAndModals.dart';
import 'package:workshop/pages/navigation2.dart';
import 'package:workshop/pages/page2.dart';
import 'package:workshop/pages/page4.dart';
import 'page3.dart';

/*
* Navigation
* --Routes
* --Named Routes
* --Push new page on stack
* --Receive data back from other page
* --Pass data to new page
* Parse Route Data Manually(check main.dart and helpers/custom-route.dart)
* unknown route as fallback (main.dart) (also for null returned in onGeneratedRoute)
*
* SnackBar
*
* */
class Navigation1Widget extends StatelessWidget{

  Widget _buildNavigationButton(BuildContext context, String text, String routeName){
    return ElevatedButton(
            onPressed: () {
          //   Navigator.push(context,
          //     MaterialPageRoute(builder: (BuildContext context) => navigateTo)
          // );
              Navigator.pushNamed(context, routeName);
        },
        child: Text(text));

  }
  Widget _buildNavigationButton1(BuildContext context, String text, Widget navigateTo){
    return ElevatedButton(
            onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => navigateTo)
                
          ).then((value) => {
              ScaffoldMessenger.of(context)
                  .showSnackBar(
                  SnackBar(
                    content:Text("Course was updated "+(value['updated']?'':'un')+"successfully"),
                    duration: Duration(seconds: 5),
                    action: SnackBarAction(
                      label: "UNDO",
                      onPressed: (){

                      },
                    ),
              ))
          });
        },
        child: Text(text));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation"),
      ),
      body: Center(
          child:Column(
            children: [
              _buildNavigationButton(context, "Page 2", "/page2"),
              SizedBox(height: 10),
              _buildNavigationButton(context, "Page 3", "/page3"),
              SizedBox(height: 10),
              _buildNavigationButton(context, "Page 4", "/page4"),
              SizedBox(height: 10),
              _buildNavigationButton1(context, "Pass Data Back and Forth", Navigation2Widget("data that was passed")),
              SizedBox(height: 10),
              _buildNavigationButton(context, "Alert & Modal", "/page5"),
              SizedBox(height: 10),
              _buildNavigationButton(context, "Course 2", "/course/2"),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
      ),
    );
  }
}