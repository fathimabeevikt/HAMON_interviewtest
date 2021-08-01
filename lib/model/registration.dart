
class Registration {
    Registration({
        required this.id,
        required this.student,
        required this.subject,
    });

    int id;
    int student;
    int subject;

    factory Registration.fromJson(Map<String, dynamic> json) => Registration(
        id: json["id"],
        student: json["student"],
        subject: json["subject"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "student": student,
        "subject": subject,
    };
}
