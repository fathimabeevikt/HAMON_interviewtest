// To parse this JSON data, do
//
//     final subject = subjectFromJson(jsonString);

import 'dart:convert';

Subject subjectFromJson(String str) => Subject.fromJson(json.decode(str));

String subjectToJson(Subject data) => json.encode(data.toJson());

class Subject {
    Subject({
        required this.credits,
        required this.id,
        required this.name,
        required this.teacher,
    });

    int credits;
    int id;
    String name;
    String teacher;

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        credits: json["credits"],
        id: json["id"],
        name: json["name"],
        teacher: json["teacher"],
    );

    Map<String, dynamic> toJson() => {
        "credits": credits,
        "id": id,
        "name": name,
        "teacher": teacher,
    };
}
