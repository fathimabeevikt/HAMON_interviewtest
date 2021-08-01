import 'package:flutter/material.dart';
import 'package:interview_test/model/classroom.dart';
import 'package:interview_test/repositories/classrooms_repository.dart';

import 'classroom_details.dart';

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
        title: Text("Classroom List"),
      ),
      body: ListView.builder(
          itemCount: widget.listofClassrooms.length,
          itemBuilder: (BuildContext context, int index) {
            int number = index + 1;
            return Card(
              child: ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.listofClassrooms[index].name,
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      TextButton(
                          onPressed: () async {
                            var classroomdetails =
                                await ClassroomRepository.fetchClassroomDetails(
                                    widget.listofClassrooms[index].id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ClassroomDetails(
                                      details: classroomdetails)),
                            );
                          },
                          child: Text("View details"))
                    ],
                  ),
                  title: Text("$number")),
            );
            // return ListTile(
            //     trailing: Text(
            //       widget.listofClassrooms[index].name,
            //       style: TextStyle(color: Colors.green, fontSize: 15),
            //     ),
            //     title: Text("$number"));
          }),
    );
  }
}
