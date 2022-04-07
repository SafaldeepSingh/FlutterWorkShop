import 'package:flutter/material.dart';

import '../../model/course.dart';
import 'course-card.dart';

class Courses extends StatelessWidget{
  final List<Course> courses;
  Courses(this.courses);

  Widget _buildCourseItem(BuildContext context, int index) {
    return CourseCard(courses[index]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildCourseItem,
      itemCount: courses.length,
    );
  }
}