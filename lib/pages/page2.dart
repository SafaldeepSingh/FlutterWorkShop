import 'package:flutter/material.dart';
/*
* Asset Image
* Network Image
* Card
* Container
* Full width to container // final double deviceWidth = MediaQuery.of(context).size.width;
* Scaffhold
* */
class Page2Widget extends StatefulWidget{

  @override
  State createState() => Page2WidgetState();
}

class Page2WidgetState extends State<Page2Widget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            FadeInImage(
              placeholder: AssetImage('images/loading.gif'),
              image: NetworkImage('https://picsum.photos/250?image=9'),
              height: 300.0,
              fit: BoxFit.cover,
            ),
            Card(
              child: Container(
                child: Image(
                  image: AssetImage('images/logo.png'),
                ),
                padding: EdgeInsets.fromLTRB(50,20,50,20),
              ),elevation: 40,
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      )
    );
  }
}