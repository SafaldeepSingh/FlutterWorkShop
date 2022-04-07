import 'package:flutter/material.dart';
import '../model/course.dart';
import '../widgets/courses/courses.dart';
/*
* ListView
* Model
* Passing data to widget(from parent to child)
* */
class Page3Widget extends StatefulWidget{

  @override
  State createState() => Page3WidgetState();
}

class Page3WidgetState extends State<Page3Widget> {
  final List<Course> courses
    = [
      Course(id:"1",title: "C++",description:   "test desc"),
      Course(id:"2",title: "Java 1",description:   "test desc"),
      Course(id:"3",title: "Java 2",description:   "test desc"),
      Course(id:"4",title: "C#",description:   "test desc"),
      Course(id:"5",title: "PHP",description:   "test desc"),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Page 3"),
        ),
        body: Container(
          width: double.infinity,
          child: Courses(courses),
        )
    );
  }
}