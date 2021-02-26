import 'package:flutter/material.dart';
import 'package:otw/components/my_progress_bar.dart';
import 'package:otw/constants.dart';
import 'package:otw/screens/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:toast/toast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final confirmpassword = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool showSpinner = false;

  void registerUser(
      String username, email, firstname, lastname, password, context) async {
    String data = json.encode({
      "username": username,
      "email": email,
      "first_name": firstname,
      "last_name": lastname,
      "password": password
    });
    setState(() {
      showSpinner = true;
    });
    http.Response response =
        await http.post("${baseUrl}auth/register", body: data, headers: {"content-type": "application/json"});
    if (response.statusCode < 210) {
      print("Successful");
      setState(() {
        showSpinner = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
      Toast.show(
        'You have registered successfully. You can Login now!',
        context,
        gravity: Toast.BOTTOM,
        duration: Toast.LENGTH_LONG,
      );
    } else {
      print(response.body);
      setState(() {
        showSpinner = false;
      });
      Toast.show('Sorry something went Wrong. Try again!', context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    firstname.dispose();
    lastname.dispose();
    email.dispose();
    confirmpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          progressIndicator: MyProgressBar(),
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
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
                      "Join Us Today",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
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
                                      return "Please enter username";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: username,
                                  decoration: textInputDecor2.copyWith(
                                      labelText: "Enter Your Username",
                                      labelStyle: labelStyle),
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please enter email";
                                    } else if (!value.contains("@")) {
                                      return "Please enter a valid email";
                                    } else if (!value.contains(".")) {
                                      return "Please enter a valid email";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: email,
                                  decoration: textInputDecor2.copyWith(
                                      labelText: "Enter Your Email",
                                      labelStyle: labelStyle),
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please enter First name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: firstname,
                                  decoration: textInputDecor2.copyWith(
                                      labelText: "Enter Your First Name",
                                      labelStyle: labelStyle),
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please enter last name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: lastname,
                                  decoration: textInputDecor2.copyWith(
                                      labelText: "Enter Your Last Name",
                                      labelStyle: labelStyle),
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please enter password";
                                    } else if (value.length < 8) {
                                      return "Please password must be at least 8 characters";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: true,
                                  controller: password,
                                  decoration: textInputDecor2.copyWith(
                                      labelText: "Enter Your Password",
                                      labelStyle: labelStyle),
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please enter password again";
                                    } else if (value != password.text) {
                                      return "Passwords do not match";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: true,
                                  controller: confirmpassword,
                                  decoration: textInputDecor2.copyWith(
                                      labelText: "Enter Your Password",
                                      labelStyle: labelStyle),
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
                        if (_formkey.currentState.validate()) {
                          registerUser(
                              username.text,
                              email.text,
                              firstname.text,
                              lastname.text,
                              password.text,
                              context);
                        }
                      },
                      child: Text("Sign Up"),
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
                          "Already have an account?",
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
                                builder: (BuildContext context) => LoginPage(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
