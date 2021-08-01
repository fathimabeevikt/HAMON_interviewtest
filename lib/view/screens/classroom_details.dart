import 'package:flutter/material.dart';
import 'package:interview_test/model/classroom.dart';
import 'package:interview_test/model/student.dart';
import 'package:interview_test/model/subject.dart';
import 'package:interview_test/repositories/classrooms_repository.dart';
import 'package:interview_test/repositories/subjects_repository.dart';

import 'components/constants.dart';

class ClassroomDetails extends StatefulWidget {
  final Classroom details;
  ClassroomDetails({required this.details});
  //const ClassroomDetails({ Key? key }) : super(key: key);

  @override
  _ClassroomDetailsState createState() => _ClassroomDetailsState();
}

class _ClassroomDetailsState extends State<ClassroomDetails> {
  late Future<List<Subject>> _subjects;
  String _dropDownValue = 'Choose Subject';
  String selectedSubjectId = '';
  @override
  void initState() {
    _subjects = SubjectRepository.fetchSubjects();
    super.initState();
  }

  String getSubjectNameById(List<Subject>? subjectsList, String? subjectId) {
    return subjectsList!
        .firstWhere((element) => element.id == int.parse(subjectId!))
        .name;
  }

  @override
  Widget build(BuildContext context) {
    double kWidth = MediaQuery.of(context).size.width;
    double kHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: FutureBuilder<List<Subject>>(
        future: _subjects,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var availableSubjects = snapshot.data;
            return Card(
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
                        Expanded(child: Text("Layout: ", style: kkTextStyle)),
                        Expanded(
                          child: Text(widget.details.layout, style: kTextStyle),
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
                          child: Text(widget.details.name, style: kTextStyle),
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
                          child: Text(widget.details.size.toString(),
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
                                    getSubjectNameById(availableSubjects,
                                        this.widget.details.subject),
                                    style: kTextStyle),
                              ),
                            ],
                          ),
                    Container(
                      child: DropdownButton(
                        hint: _dropDownValue == null
                            ? Text('Choose Subject')
                            : Text(
                                _dropDownValue,
                                style: TextStyle(color: Colors.blue),
                              ),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: TextStyle(color: Colors.blue),
                        items: availableSubjects!.map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val.name,
                              child: Text(val.name),
                              onTap: () async {
                                setState(() {
                                  selectedSubjectId = val.id.toString();
                                  this.widget.details.subject =
                                      val.id.toString();
                                });

                                await ClassroomRepository
                                    .assignSubjectToClassRoom(widget.details.id,
                                        int.parse(selectedSubjectId));
                              },
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              _dropDownValue = val.toString();
                            },
                          );
                        },
                      ),
                    )
                  ],

                  // child: Text(widget.details.name),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
