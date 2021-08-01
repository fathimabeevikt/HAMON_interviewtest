import 'package:flutter/material.dart';
import 'package:interview_test/repositories/students_repository.dart';
import 'package:interview_test/view/screens/classroom_list.dart';
import 'package:interview_test/view/screens/subject_List.dart';
import 'package:interview_test/view/screens/sutdent_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  @override
  Widget build(BuildContext context) {
    double kWidth = MediaQuery.of(context).size.width;
    double kWeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: kWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                var students = await StudentRepository.fetchStudents();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentList(listofStudents:students),)
                );
              },
              child: Text("Students"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubjectList()),
                );
              },
              child: Text("Subjects"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClassroomList()),
                );
              },
              child: Text("Class Rooms"),
            ),
            // RaisedButton(onPressed: onPressed),
            // RaisedButton(onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}
