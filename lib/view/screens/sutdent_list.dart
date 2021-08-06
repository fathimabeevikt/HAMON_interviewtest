import 'package:flutter/material.dart';
import 'package:interview_test/model/student.dart';
import 'package:interview_test/repositories/students_repository.dart';
import 'package:interview_test/view/screens/components/constants.dart';

class StudentList extends StatefulWidget {
  final List<Student> listofStudents;
  StudentList({required this.listofStudents});
  // const StudentList({Key? key}) : super(key: key);

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  // List<Student> students = widget.listofStudents;
  Widget setupAlertDialoadContainer(Student details) {
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
                          "Age: ",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Expanded(
                        child: Text(details.age.toString(),
                            style: Theme.of(context).textTheme.headline2),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text("Email: ",
                              style: Theme.of(context).textTheme.headline1)),
                      Expanded(
                        child: Text(details.email,
                            style: Theme.of(context).textTheme.headline2),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Id: ",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Expanded(
                        child: Text(details.id.toString(),
                            style: Theme.of(context).textTheme.headline2),
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
                        child: Text(details.name.toString(),
                            style: Theme.of(context).textTheme.headline2),
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
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Student List"),
      ),
      body: ListView.builder(
          itemCount: widget.listofStudents.length,
          itemBuilder: (BuildContext context, int index) {
            int number = index + 1;
            return ListTile(
                trailing: TextButton(
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).accentColor),
                    onPressed: () async {
                      var studentdetails =
                          await StudentRepository.fetchStudentDetails(
                              widget.listofStudents[index].id);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Details'),
                              content:
                                  setupAlertDialoadContainer(studentdetails),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("CLOSE",style: TextStyle(color: Theme.of(context).primaryColor),))
                              ],
                            );
                          });
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
                        widget.listofStudents[index].name,
                      ),
                    ),
                  ],
                ));
          }),
    );
  }
}
