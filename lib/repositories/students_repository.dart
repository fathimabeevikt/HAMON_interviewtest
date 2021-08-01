import 'dart:convert';

import 'package:interview_test/model/registration.dart';
import 'package:interview_test/model/student.dart';
import 'package:http/http.dart' as http;
import 'package:interview_test/providers/apiurls.dart';
import 'package:interview_test/repositories/registration_dto.dart';
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
      studentslist = studentsDto.students;
    }
    return studentslist;
  }

  static Future<Student> fetchStudentDetails(int id) async {
    Map<String, String> queryparams = {'api_key': 'D5351'};
    var response = await http.get(new Uri.https(
        ApiUrls.BASE_URL, ApiUrls.STUDENTS + id.toString(), queryparams));
    var data = convert.jsonDecode(response.body);
    var student = Student.fromJson(data);
    return student;
  }

  static Future assignStudentToClassRoom(int studentId, int subjectId) async {
    Map<String, String> queryparams = {'api_key': 'D5351'};
    var response = await http.post(
      new Uri.https(ApiUrls.BASE_URL, ApiUrls.REGISTRATION, queryparams),
      body: {"subject": subjectId.toString(), "student": studentId.toString()},
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
    );
    if (response.statusCode == 200) {}
  }

  static Future<List<Registration>> FetchAllRegistrations() async {
    List<Registration> registrations = [];
    Map<String, String> queryparams = {'api_key': 'D5351'};
    var response = await http.get(
        new Uri.https(ApiUrls.BASE_URL, ApiUrls.REGISTRATION, queryparams));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      var registrationDto = RegisterationDto.fromJson(data);
      registrations = registrationDto.registrations;
    }
    return registrations;
  }
}
