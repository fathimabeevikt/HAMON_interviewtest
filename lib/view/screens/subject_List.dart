import 'package:flutter/material.dart';
import 'package:interview_test/model/subject.dart';
import 'package:interview_test/repositories/subjects_repository.dart';
import 'package:interview_test/view/screens/components/constants.dart';

class SubjectList extends StatefulWidget {
  final List<Subject> listofSubjects;
  SubjectList({required this.listofSubjects});
  // const SubjectList({ Key? key }) : super(key: key);

  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  Widget setupAlertDialoadContainer(Subject details) {
    return Container(
      height: 250,
      child: Column(
        //mainAxisAlignment:MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Credit : ",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Expanded(
                        child:
                            Text(details.credits.toString(), style: Theme.of(context).textTheme.headline2),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text("Id : ", style: Theme.of(context).textTheme.headline1)),
                      Expanded(
                        child: Text(details.id.toString(), style: Theme.of(context).textTheme.headline2),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Name : ",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Expanded(
                        child: Text(details.name.toString(), style: Theme.of(context).textTheme.headline2),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Teacher : ",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Expanded(
                        child:
                            Text(details.teacher.toString(), style: Theme.of(context).textTheme.headline2),
                      ),
                    ],
                  ),
                ],

                // child: Text(widget.details.name),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subject List"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: widget.listofSubjects.length,
            itemBuilder: (BuildContext context, int index) {
              int number = index + 1;
              return ListTile(
                  trailing: TextButton(
                    style: TextButton.styleFrom(primary: Theme.of(context).accentColor),
                    onPressed: () async {
                      var subjectdetails =
                          await SubjectRepository.fetchSubjectDetails(
                              widget.listofSubjects[index].id);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Details"),
                              content:
                                  setupAlertDialoadContainer(subjectdetails),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("CLOSE",style: TextStyle(color: Theme.of(context).primaryColor),),
                                )
                              ],
                            );
                          });
                    },
                    child: Text("View details"),
                  ),
                  title: Row(
                    children: [
                      Text(
                        "$number" + ".",
                        style: Theme.of(context).textTheme.headline1,
                      ),
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
