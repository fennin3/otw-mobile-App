import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otw/components/my_progress_bar.dart';
import 'package:otw/constants.dart';
import 'package:otw/screens/landing.dart';
import 'package:otw/screens/register_page.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:convert';
import 'package:toast/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity/connectivity.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  bool showSpinner = false;
  final _formkey = GlobalKey<FormState>();

  void checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("Connected to Mobile Network");
      if (sharedPreferences.getStringList("user_details") != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => LandingPage(),
            ),
            (Route<dynamic> route) => false);
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("Connected to WiFi");
      if (sharedPreferences.getStringList("user_details") != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => LandingPage(),
            ),
            (Route<dynamic> route) => false);
      }
    } else {
      print("Unable to connect. Please Check Internet Connection");

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => NoInternet(),
      //     ));
    }
  }

  void login(String username, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      showSpinner = true;
    });
    Map data = {"username": username, "password": password};
    http.Response response = await http.post(
      "${baseUrl}login/",
      body: data,
    );
    if (response.statusCode < 210) {
      print("Success");
      Map res = json.decode(response.body);
      print(res);
      setState(() {
        showSpinner = false;
      });
      List<String> dataList = [
        res['id'].toString(),
        res['username'],
        res['email'],
        res['token'],
      ];
      await prefs.setStringList("user_details", dataList);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => LandingPage(),
        ),
        (route) => false,
      );
    } else {
      print("Failed");
      print(
        json.decode(response.body)[0],
      );
      setState(() {
        showSpinner = false;
      });
      Toast.show(
        '${json.decode(response.body)[0]}',
        context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.CENTER,
      );
    }
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        progressIndicator: MyProgressBar(),
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.red],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "OTW",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Login To Continue",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Container(
                    child: Card(
                      elevation: 20,
                      color: Colors.white10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Form(

                          key: _formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please enter your username";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: username,
                                decoration: textInputDecor2.copyWith(
                                    labelText: "Enter Your Username"),
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please enter your password";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: password,
                                decoration: textInputDecor2.copyWith(
                                    labelText: "Enter Your Password"),
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if(_formkey.currentState.validate()){
                        login(username.text, password.text);
                      }
                    },
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onSurface: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Need an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => RegisterPage(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
