// To parse this JSON data, do
//
//     final classroom = classroomFromJson(jsonString);

import 'dart:convert';

Classroom classroomFromJson(String str) => Classroom.fromJson(json.decode(str));

String classroomToJson(Classroom data) => json.encode(data.toJson());

class Classroom {
    Classroom({
        required this.id,
        required this.layout,
        required this.name,
        required this.size,
        this.subject,
    });

    int id;
    String layout;
    String name;
    int size;
    String? subject;

    factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
        id: json["id"],
        layout: json["layout"],
        name: json["name"],
        size: json["size"],
        subject: json["subject"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "layout": layout,
        "name": name,
        "size": size,
        "subject": subject,
    };
}
