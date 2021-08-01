import 'dart:convert';

import 'package:interview_test/model/student.dart';

String studentsDtoToJson(StudentsDto data) => json.encode(data.toJson());

class StudentsDto {
  List<Student> students = [];
  StudentsDto({
    required this.students,
  });

  factory StudentsDto.fromJson(Map<String, dynamic> json) => StudentsDto(
        students: List<Student>.from(
            json["students"].map((x) => Student.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "students": List<dynamic>.from(students.map((x) => x.toJson())),
      };
}
