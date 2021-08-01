// To parse this JSON data, do
//
//     final classroomsDto = classroomsDtoFromJson(jsonString);

import 'dart:convert';

import 'package:interview_test/model/classroom.dart';

ClassroomsDto classroomsDtoFromJson(String str) => ClassroomsDto.fromJson(json.decode(str));

String classroomsDtoToJson(ClassroomsDto data) => json.encode(data.toJson());

class ClassroomsDto {
    ClassroomsDto({
        required this.classrooms,
    });

    List<Classroom> classrooms;

    factory ClassroomsDto.fromJson(Map<String, dynamic> json) => ClassroomsDto(
        classrooms: List<Classroom>.from(json["classrooms"].map((x) => Classroom.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "classrooms": List<dynamic>.from(classrooms.map((x) => x.toJson())),
    };
}

