import 'package:flutter/material.dart';
import 'package:interview_test/model/subject.dart';
import 'package:interview_test/repositories/subjects_repository.dart';
import 'package:interview_test/view/screens/components/constants.dart';
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
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: widget.listofSubjects.length,
            itemBuilder: (BuildContext context, int index) {
              int number = index + 1;
              return ListTile(
                  trailing: 
                      TextButton(
                        style: TextButton.styleFrom(primary: kColorgreen),
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
                        child: Text("View details"),
                     
                  ),
                  title: Row(
                    children: [
                    Text("$number"+".",style: kkTextStyle,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.listofSubjects[index].name,
                        ),
                      ),
                    ],
                  ));
            }),
      ),
    );
  }
}
