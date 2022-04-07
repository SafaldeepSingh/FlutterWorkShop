import 'package:flutter/material.dart';

import '../../model/course.dart';

class CourseCard extends StatelessWidget{
  final Course course;
  CourseCard(this.course);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Text(course.title),
            Row(
              children: [
                OutlinedButton(onPressed: () {}, child: Text("Edit")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: Text("Delete"),),
              ],
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      ),
    );
  }
}