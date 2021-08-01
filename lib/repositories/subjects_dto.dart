// To parse this JSON data, do
//
//     final subjectsDto = subjectsDtoFromJson(jsonString);

import 'dart:convert';

import 'package:interview_test/model/subject.dart';

SubjectsDto subjectsDtoFromJson(String str) => SubjectsDto.fromJson(json.decode(str));

String subjectsDtoToJson(SubjectsDto data) => json.encode(data.toJson());

class SubjectsDto {
    SubjectsDto({
        required this.subjects,
    });

    List<Subject> subjects;

    factory SubjectsDto.fromJson(Map<String, dynamic> json) => SubjectsDto(
        subjects: List<Subject>.from(json["subjects"].map((x) => Subject.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "subjects": List<dynamic>.from(subjects.map((x) => x.toJson())),
    };
}
