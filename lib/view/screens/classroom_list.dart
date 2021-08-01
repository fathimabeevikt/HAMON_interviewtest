import 'package:flutter/material.dart';
import 'package:interview_test/model/classroom.dart';

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
        title: Text("Student List"),
      ),
      body: ListView.builder(
          itemCount: widget.listofClassrooms.length,
          itemBuilder: (BuildContext context, int index) {
            index = index + 1;
            return ListTile(
                trailing: Text(
                  widget.listofClassrooms[index].name,
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text("$index"));
          }),
    );
  }
}