import 'package:http/http.dart' as http;
import 'package:interview_test/model/subject.dart';
import 'package:interview_test/providers/apiurls.dart';
import 'dart:convert' as convert;

import 'package:interview_test/repositories/subjects_dto.dart';

class SubjectRepository {
  // StudentRepository();
  static Future<List<Subject>> fetchSubjects() async {
    List<Subject> subjectslist = [];
    Map<String, String> queryparams = {'api_key': 'D5351'};
    var response = await http
        .get(new Uri.https(ApiUrls.BASE_URL, ApiUrls.SUBJECTS, queryparams));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      var subjectsDto = SubjectsDto.fromJson(data);
      subjectslist = subjectsDto.subjects;
    }
    return subjectslist;
  }
   static Future<Subject> fetchSubjectDetails(int id) async {
    Map<String, String> queryparams = {'api_key': 'D5351'};
    var response = await http.get(new Uri.https(
        ApiUrls.BASE_URL, ApiUrls.SUBJECTS + id.toString(), queryparams));
    var data = convert.jsonDecode(response.body);
    var subject = Subject.fromJson(data);
    return subject;
  }
}
