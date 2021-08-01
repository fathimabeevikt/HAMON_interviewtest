import 'package:flutter/material.dart';
import 'package:interview_test/model/student.dart';
import 'package:interview_test/repositories/students_repository.dart';
import 'package:interview_test/view/screens/student_details.dart';

class StudentList extends StatefulWidget {
  final List<Student> listofStudents;
  StudentList({required this.listofStudents});
  // const StudentList({Key? key}) : super(key: key);

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  // List<Student> students = widget.listofStudents;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student List"),
      ),
      body: ListView.builder(
          itemCount: widget.listofStudents.length,
          itemBuilder: (BuildContext context, int index) {
            int number = index + 1;
            return ListTile(
                trailing: Row(
                   mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.listofStudents[index].name,
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () async {
                          var studentdetails =
                              await StudentRepository.fetchStudentDetails(
                                  widget.listofStudents[index].id);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    StudentDetails(details: studentdetails)),
                          );
                        },
                        child: Text("View details"))
                  ],
                ),
                title: Text("$number"));
          }),
    );
  }
}
