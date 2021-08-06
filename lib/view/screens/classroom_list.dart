import 'package:flutter/material.dart';
import 'package:interview_test/model/classroom.dart';
import 'package:interview_test/repositories/classrooms_repository.dart';
import 'package:interview_test/repositories/students_repository.dart';

import 'classroom_details.dart';
import 'components/constants.dart';

class ClassroomList extends StatefulWidget {
  final List<Classroom> listofClassrooms;
  ClassroomList({required this.listofClassrooms});
  // const ClassroomList({ Key? key }) : super(key: key);

  @override
  _ClassroomListState createState() => _ClassroomListState();
}

class _ClassroomListState extends State<ClassroomList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Classroom List"),
      ),
      body: ListView.builder(
          itemCount: widget.listofClassrooms.length,
          itemBuilder: (BuildContext context, int index) {
            int number = index + 1;
            return Card(
              child: ListTile(
                trailing: TextButton(
                    style: TextButton.styleFrom(primary: Theme.of(context).accentColor),
                    onPressed: () async {
                      var classroomdetails =
                          await ClassroomRepository.fetchClassroomDetails(
                              widget.listofClassrooms[index].id);
                      var studentslist =
                          await StudentRepository.fetchStudents();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClassroomDetails(
                                details: classroomdetails,
                                allStudents: studentslist)),
                      );
                    },
                    child: Text("View details")),
                title: Row(
                  children: [
                    Text(
                      "$number" + ".",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.listofClassrooms[index].name,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
