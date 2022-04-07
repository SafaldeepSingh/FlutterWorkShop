
import 'package:flutter/material.dart';

class AlertAndModals extends StatelessWidget{

  _alertDialog(context){
    showDialog( context: context, builder: (BuildContext context) {
      return AlertDialog(title: Text('Are you sure?'), content: Text('This action can\'t be undone'),
          actions: <Widget>[
            TextButton(child: Text('DISCARD'), onPressed: (){
              Navigator.pop(context);
            }),
            TextButton(child: Text('CONTINUE'), onPressed: (){
              Navigator.pop(context);
            }),
          ]);
    });

  }
  _modalDialog(context){
    showModalBottomSheet(context: context, builder: (BuildContext context) {
      return Center(child: Text('This is a Modal !'),);
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert & Modal"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {_alertDialog(context);}, child: Text("Show Alert Dialog")),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {_modalDialog(context);}, child: Text("Show Modal")),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}