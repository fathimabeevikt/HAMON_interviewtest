// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
    Student({
        required this.age,
        required this.email,
        required this.id,
        required this.name,
    });

    int age;
    String email;
    int id;
    String name;

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        age: json["age"],
        email: json["email"],
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "age": age,
        "email": email,
        "id": id,
        "name": name,
    };
}

