import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mycourse/course_model.dart';

class CourseService {
  Future<List<Course>> showCourse() async {
    var url = 'http://si-sdm.id/ecourse/api/web/v1/courses/all';

    var response = await http.get(Uri.parse(url));

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['items'];
      List<Course> course = [];

      for (var item in data) {
        course.add(Course.fromJson(item));
      }
      return course;
    } else {
      throw Exception('Failed To Get Data!');
    }
  }
}
