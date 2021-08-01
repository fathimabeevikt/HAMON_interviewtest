import 'package:flutter/material.dart';
import 'package:interview_test/model/classroom.dart';
import 'package:interview_test/model/registration.dart';
import 'package:interview_test/model/student.dart';
import 'package:interview_test/model/subject.dart';
import 'package:interview_test/repositories/classrooms_repository.dart';
import 'package:interview_test/repositories/students_repository.dart';
import 'package:interview_test/repositories/subjects_repository.dart';

import 'components/constants.dart';

class ClassroomDetails extends StatefulWidget {
  final Classroom details;
  final List<Student> allStudents;
  ClassroomDetails({required this.details, required this.allStudents});
  //const ClassroomDetails({ Key? key }) : super(key: key);

  @override
  _ClassroomDetailsState createState() => _ClassroomDetailsState();
}

class _ClassroomDetailsState extends State<ClassroomDetails> {
  late Future<List<Subject>> _subjects;
  late Future<List<Student>> _students;
  late Future<List<Registration>> _registrations;

  List<int> alreadyEnrolledStudentIds = [];

  String _subjectdropDownValue = 'Choose Subject';
  String _studentdropDownValue = 'Choose Student';
  String selectedSubjectId = '';
  int? selectedStudentId;
  List<Student> _listofstudents = [];
  List<Registration> _listofregistrations = [];
  Map studentIdsAndRegistrationIds = new Map();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _subjects = SubjectRepository.fetchSubjects();
    _students = StudentRepository.fetchStudents();
    _registrations = StudentRepository.fetchAllRegistrations();

    super.initState();
  }

  String getSubjectNameById(List<Subject>? subjectsList, String? subjectId) {
    return subjectsList!
        .firstWhere((element) => element.id == int.parse(subjectId!))
        .name;
  }

  void loadEnrolledStudents() {
    List<int> needTodisplay = [];

    _listofregistrations.retainWhere(
        (element) => element.subject == int.parse(widget.details.subject!));

    for (var item in _listofregistrations) {
      needTodisplay.add(item.student);
      studentIdsAndRegistrationIds.putIfAbsent(item.student, () => item.id);
    }

    _listofstudents = widget.allStudents
        .where((element) => needTodisplay.contains(element.id))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double kWidth = MediaQuery.of(context).size.width;
    double kHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Details"),
        ),
        body: SingleChildScrollView(
          child: Card(
              child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      FutureBuilder<List<Subject>>(
                        future: _subjects,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var availableSubjects = snapshot.data;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Id: ",
                                        style: kkTextStyle,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(widget.details.id.toString(),
                                          style: kTextStyle),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Text("Layout: ",
                                            style: kkTextStyle)),
                                    Expanded(
                                      child: Text(widget.details.layout,
                                          style: kTextStyle),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Name: ",
                                        style: kkTextStyle,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(widget.details.name,
                                          style: kTextStyle),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Size: ",
                                        style: kkTextStyle,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                          widget.details.size.toString(),
                                          style: kTextStyle),
                                    ),
                                  ],
                                ),
                                widget.details.subject!.isEmpty
                                    ? Container()
                                    : Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Subject : ",
                                              style: kkTextStyle,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                                getSubjectNameById(
                                                    availableSubjects,
                                                    this
                                                        .widget
                                                        .details
                                                        .subject),
                                                style: kTextStyle),
                                          ),
                                        ],
                                      ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    DecoratedBox(
                                      decoration: ShapeDecoration(
                                        //color: Colors.cyan,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1.0,
                                              style: BorderStyle.solid,
                                              color: kcolorash),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40.0, vertical: 0.0),
                                        child: DropdownButton(
                                          hint: _subjectdropDownValue == null
                                              ? Text('Choose Subject')
                                              : Text(
                                                  _subjectdropDownValue,
                                                ),
                                          isExpanded: true,
                                          iconSize: 30.0,
                                          //style: TextStyle(color: Colors.blue),
                                          items: availableSubjects!.map(
                                            (val) {
                                              return DropdownMenuItem<String>(
                                                value: val.name,
                                                child: Text(val.name),
                                                onTap: () async {
                                                  setState(() {
                                                    selectedSubjectId =
                                                        val.id.toString();
                                                    this
                                                            .widget
                                                            .details
                                                            .subject =
                                                        val.id.toString();
                                                  });

                                                  await ClassroomRepository
                                                      .assignSubjectToClassRoom(
                                                          widget.details.id,
                                                          int.parse(
                                                              selectedSubjectId));
                                                },
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (val) {
                                            setState(
                                              () {
                                                _subjectdropDownValue =
                                                    val.toString();
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            primary: kColorgreen),
                                        onPressed: () {},
                                        child: widget.details.subject == ''
                                            ? Text("Assign Subject")
                                            : Text("Update Subject"))
                                  ],
                                ),
                              ],

                              // child: Text(widget.details.name),
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }

                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          (widget.details.subject != "")
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    DecoratedBox(
                                      decoration: ShapeDecoration(
                                        //color: Colors.cyan,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1.0,
                                              style: BorderStyle.solid,
                                              color: kcolorash),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40.0, vertical: 0.0),
                                        child: DropdownButton(
                                          hint: _studentdropDownValue == null
                                              ? Text('Choose Subject')
                                              : Text(
                                                  _studentdropDownValue,
                                                ),
                                          isExpanded: true,
                                          iconSize: 30.0,
                                          // style: TextStyle(color: Colors.blue),
                                          items: widget.allStudents.map(
                                            (val) {
                                              return DropdownMenuItem<String>(
                                                value: val.name,
                                                child: Text(val.name),
                                                onTap: () {
                                                  setState(() {
                                                    selectedStudentId = val.id;
                                                  });
                                                  // setState(() {
                                                  //   selectedSubjectId = val.id.toString();
                                                  //   this.widget.details.subject = val.id.toString();
                                                  // });

                                                  // await ClassroomRepository.assignSubjectToClassRoom(
                                                  //     widget.details.id, int.parse(selectedSubjectId));
                                                },
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (val) {
                                            setState(
                                              () {
                                                _studentdropDownValue =
                                                    val.toString();
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),

                                    // By default, show a loading spinner.

                                    TextButton(
                                        style: TextButton.styleFrom(
                                            primary: kColorgreen),
                                        onPressed: () async {
                                          await StudentRepository
                                              .assignStudentToClassRoom(
                                                  selectedStudentId!,
                                                  selectedSubjectId == ''
                                                      ? int.parse(widget
                                                          .details.subject!)
                                                      : int.parse(
                                                          selectedSubjectId));
                                          loadEnrolledStudents();
                                        },
                                        child: Text("Enroll")),
                                  ],
                                )
                              : Container(),
                          Column(
                            children: [
                              (widget.details.subject == "")
                                  ? Container()
                                  : FutureBuilder<List<Registration>>(
                                      future: _registrations,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          _listofregistrations = snapshot.data!;
                                          loadEnrolledStudents();
                                          return ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: _listofstudents.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                int number = index + 1;
                                                return ListTile(
                                                  trailing: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        _listofstudents[index]
                                                            .name,
                                                      ),
                                                      IconButton(
                                                        onPressed: () async {
                                                          var deleteResult = await StudentRepository
                                                              .deleteStudentFromClassRoom(
                                                                  studentIdsAndRegistrationIds[
                                                                      _listofstudents[
                                                                              index]
                                                                          .id]);
                                                          if (deleteResult) {
                                                            _scaffoldkey
                                                                .currentState!
                                                                .showSnackBar(
                                                                    new SnackBar(
                                                                        content:
                                                                            new Text("Deleted Successfully")));
                                                          }
                                                          setState(() {
                                                            _listofstudents.removeWhere(
                                                                (element) =>
                                                                    element
                                                                        .id ==
                                                                    _listofstudents[
                                                                            index]
                                                                        .id);
                                                          });
                                                          //loadEnrolledStudents();
                                                        },
                                                        icon: Icon(Icons.delete,
                                                            color: Colors.red),
                                                      )
                                                      // TextButton(
                                                      //     onPressed: () async {
                                                      //       var subjectdetails =
                                                      //           await SubjectRepository.fetchSubjectDetails(
                                                      //               widget.listofSubjects[index].id);
                                                      //       Navigator.push(
                                                      //         context,
                                                      //         MaterialPageRoute(
                                                      //             builder: (context) =>
                                                      //                 SubjectDetails(details: subjectdetails)),
                                                      //       );
                                                      //     },
                                                      //     child: Text("View details")),
                                                    ],
                                                  ),
                                                  title: Text(
                                                    "$number" + ".",
                                                    style: kkTextStyle,
                                                  ),
                                                );
                                              });
                                        } else {
                                          return Container();
                                        }
                                      })
                            ],
                          )
                        ],
                      ),
                    ]),
                  ))),
        ));
  }
}
