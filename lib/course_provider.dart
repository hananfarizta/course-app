import 'package:flutter/material.dart';
import 'package:mycourse/course_model.dart';
import 'package:mycourse/course_service.dart';

class CourseProvider with ChangeNotifier {
  List<Course> _course = [];
  List<Course> get course => _course;
  set course(List<Course> course) {
    _course = course;
    notifyListeners();
  }

  Future<List<Course>> showCourse() async {
    try {
      List<Course>? course = await CourseService().showCourse();
      _course = course;
      return course;
    } catch (e) {
      print(e);
      var course = Course();
      List<Course> model = [course];
      return model;
    }
  }
}
