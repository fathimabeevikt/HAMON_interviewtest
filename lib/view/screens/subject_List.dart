import 'package:flutter/material.dart';
import 'package:interview_test/model/subject.dart';

class SubjectList extends StatefulWidget {
   final List<Subject> listofSubjects;
  SubjectList({required this.listofSubjects});
 // const SubjectList({ Key? key }) : super(key: key);

  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student List"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: widget.listofSubjects.length,
            itemBuilder: (BuildContext context, int index) {
              index = index + 1;
              return ListTile(
                  trailing: Text(
                    widget.listofSubjects[index].name,
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  title: Text("$index"));
            }),
      ),
    );
  }
}