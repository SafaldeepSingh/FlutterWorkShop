
import 'package:flutter/material.dart';
import 'package:workshop/widgets/courses/course-card.dart';

import '../model/course.dart';

class CoursePage extends StatelessWidget{
  final Course course;
  CoursePage(this.course);
  @override
  Widget build(BuildContext context) {
    return CourseCard(course);
  }
}