import 'package:interview_test/model/student.dart';
import 'package:http/http.dart' as http;
import 'package:interview_test/providers/apiurls.dart';
import 'dart:convert' as convert;

import 'package:interview_test/repositories/students_dto.dart';

class StudentRepository {
  // StudentRepository();
  static Future<List<Student>> fetchStudents() async {
    List<Student> studentslist = [];
    Map<String, String> queryparams = {'api_key': 'D5351'};
    var response = await http
        .get(new Uri.https(ApiUrls.BASE_URL, ApiUrls.STUDENTS, queryparams));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      var studentsDto = StudentsDto.fromJson(data);
      studentslist = studentsDto.studentsList;
    }
    return studentslist;
  }
}
