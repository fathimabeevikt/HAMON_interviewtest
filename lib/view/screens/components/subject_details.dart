// import 'package:flutter/material.dart';
// import 'package:interview_test/model/classroom.dart';


// import 'constants.dart';

// class ClassroomDetails extends StatefulWidget {
//   final Classroom details;
//   ClassroomDetails({required this.details});
//   //const ClassroomDetails({ Key? key }) : super(key: key);

//   @override
//   _ClassroomDetailsState createState() => _ClassroomDetailsState();
// }

// class _ClassroomDetailsState extends State<ClassroomDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Card(
//             child: Padding(
//                                 padding: EdgeInsets.all(16.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Expanded(
//                                           child: Text(
//                                             "Credits: ",
//                                             style: kkTextStyle,
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: Text(widget.details.credits,
//                                               style: kTextStyle),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Expanded(
//                                           child: Text("Id: ",
//                                               style: kkTextStyle),
//                                         ),
//                                         Expanded(
//                                           child: Text(
//                                               listss[index]["t_vehicle_no"],
//                                               style: kTextStyle),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Expanded(
//                                             child: Text("Name: ",
//                                                 style: kkTextStyle)),
//                                         Expanded(
//                                           child: Text(
//                                               listss[index]["t_locality"],
//                                               style: kTextStyle),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         Expanded(
//                                           child: Text(
//                                             "Teacher: ",
//                                             style: kkTextStyle,
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: Text(listss[index]["t_phone"],
//                                               style: kTextStyle),
//                                         ),
//                                       ],
//                                     ),
                                    
//                                       ],

//            // child: Text(widget.details.name),
//           ),
//         ),
//       ),
//     );
//   }
// }
