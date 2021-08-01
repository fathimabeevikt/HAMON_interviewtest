import 'package:flutter/material.dart';
import 'package:interview_test/model/classroom.dart';

import 'components/constants.dart';

class ClassroomDetails extends StatefulWidget {
  final Classroom details;
  ClassroomDetails({required this.details});
  //const ClassroomDetails({ Key? key }) : super(key: key);

  @override
  _ClassroomDetailsState createState() => _ClassroomDetailsState();
}

class _ClassroomDetailsState extends State<ClassroomDetails> {
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
                            "Id: ",
                            style: kkTextStyle,
                          ),
                        ),
                        Expanded(
                          child:
                              Text(widget.details.id.toString(), style: kTextStyle),
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
