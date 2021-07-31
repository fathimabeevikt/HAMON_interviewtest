import 'package:flutter/material.dart';
import 'package:interview_test/view/screens/home_screen.dart';

import 'components/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? _email;
  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            key: _scaffoldkey,
            backgroundColor: kPrimaryColor,
            //key: _con.scaffoldKey,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: Stack(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, kwidth / 25, 0, 0),
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          Container(
                              width: kwidth / 1.2,
                              height: kheight / 1.6,
                              decoration: BoxDecoration(
                                  color: kPrimaryLightColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 50,
                                      color: kPrimaryColor.withOpacity(0.2),
                                    )
                                  ]),
                              child: Form(
                                key: formkey,
                                // key: _con.loginFormKey,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      kwidth / 18, kwidth / 18, kwidth / 18, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: ([
                                        Padding(
                                          padding: EdgeInsets.all(kwidth / 18),
                                          child: TextFormField(
                                            onChanged: (value) {
                                              setState(() {
                                                _email = value.trim();
                                              });
                                            },
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            //controller: emailController,
                                            decoration: InputDecoration(
                                              labelText: "Enter Email Address",
                                              prefixIcon: Icon(
                                                Icons.email,
                                                color: kPrimaryColor,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: kcolorash),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: kcolorash),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            // The validator receives the text that the user has entered.
                                          ),
                                        ),
                                        SizedBox(height: kheight/13,),
                                        SizedBox(
                                          height: kheight / 20,
                                          child: RaisedButton(
                                              child: Text(
                                                "Generate Key",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    letterSpacing: 1),
                                              ),
                                              textColor: kPrimaryLightColor,
                                              color: kPrimaryColor,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeScreen()),
                                                );
                                              }),
                                        ),
                             ]) ))))]),
                                ),
                              )
                        ])]))));
                  
                
              
            
  }
}
