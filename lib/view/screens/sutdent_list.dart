import 'package:flutter/material.dart';
import 'package:interview_test/model/student.dart';

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
                trailing: Text(
                  widget.listofStudents[index].name,
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text("$number"));
                
          }),
    );
  }
}
