import 'package:flutter/material.dart';

class Navigation2Widget extends StatelessWidget{
  final String dataPassed;
  Navigation2Widget(this.dataPassed);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation 2"),
      ),
      body: Center(
        child: Column(
            children: [
              Text(dataPassed),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, {'updated': true});
                  },
                  child: Text("Go Back"))
            ],
          )
      ),
    );
  }
}