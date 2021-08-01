import 'dart:convert';

import 'package:interview_test/model/student.dart';

String studentsDtoToJson(StudentsDto data) => json.encode(data.toJson());

class StudentsDto {
  List<Student> studentsList = [];
  StudentsDto({
    required this.studentsList,
  });

  factory StudentsDto.fromJson(Map<String, dynamic> json) => StudentsDto(
        studentsList: List<Student>.from(
            json["students"].map((x) => Student.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "students": List<dynamic>.from(studentsList.map((x) => x.toJson())),
      };
}
