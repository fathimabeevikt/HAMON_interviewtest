import 'package:interview_test/model/classroom.dart';

import 'package:http/http.dart' as http;
import 'package:interview_test/providers/apiurls.dart';
import 'package:interview_test/repositories/classrooms_dto.dart';
import 'dart:convert' as convert;

class ClassroomRepository {
  // StudentRepository();
  static Future<List<Classroom>> fetchClassrooms() async {
    List<Classroom> classroomlist = [];
    Map<String, String> queryparams = {'api_key': 'D5351'};
    var response = await http
        .get(new Uri.https(ApiUrls.BASE_URL, ApiUrls.CLASS_ROOMS, queryparams));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      var classroomsDto = ClassroomsDto.fromJson(data);
      classroomlist = classroomsDto.classrooms;
    }
    return classroomlist;
  }

  static Future<Classroom> fetchClassroomDetails(int id) async {
    Map<String, String> queryparams = {'api_key': 'D5351'};
    var response = await http.get(new Uri.https(
        ApiUrls.BASE_URL, ApiUrls.CLASS_ROOMS + id.toString(), queryparams));
    var data = convert.jsonDecode(response.body);
    var classroom = Classroom.fromJson(data);
    return classroom;
  }
}
