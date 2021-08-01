import 'package:flutter/material.dart';
import 'package:interview_test/model/classroom.dart';
import 'package:interview_test/model/student.dart';

import 'components/constants.dart';

class StudentDetails extends StatefulWidget {
  final Student details;
  StudentDetails({required this.details});
  //const ClassroomDetails({ Key? key }) : super(key: key);

  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  Widget build(BuildContext context) {
    double kWidth = MediaQuery.of(context).size.width;
    double kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Details"),),
      body: Container(
        child: Column(
          //mainAxisAlignment:MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
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
                            style: kkTextStyle,
                          ),
                        ),
                        Expanded(
                          child:
                              Text(widget.details.age.toString(), style: kTextStyle),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Text("Email: ", style: kkTextStyle)),
                        Expanded(
                          child: Text(widget.details.email, style: kTextStyle),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Id: ",
                            style: kkTextStyle,
                          ),
                        ),
                        Expanded(
                          child: Text(widget.details.id.toString(), style: kTextStyle),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Name : ",
                            style: kkTextStyle,
                          ),
                        ),
                        Expanded(
                          child: Text(widget.details.name.toString(),
                              style: kTextStyle),
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
      ),
    );
  }
}
