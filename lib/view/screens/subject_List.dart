import 'package:flutter/material.dart';
import 'package:interview_test/model/subject.dart';
import 'package:interview_test/repositories/subjects_repository.dart';
import 'package:interview_test/view/screens/subject_details.dart';

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
        title: Text("Subject List"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: widget.listofSubjects.length,
            itemBuilder: (BuildContext context, int index) {
              int number = index + 1;
              return ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.listofSubjects[index].name,
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      TextButton(
                          onPressed: () async {
                            var subjectdetails =
                                await SubjectRepository.fetchSubjectDetails(
                                    widget.listofSubjects[index].id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SubjectDetails(details: subjectdetails)),
                            );
                          },
                          child: Text("View details")),
                    ],
                  ),
                  title: Text("$number"));
            }),
      ),
    );
  }
}
