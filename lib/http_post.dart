// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:otw/screens/login.dart';
// import 'package:toast/toast.dart';
// import 'package:http/http.dart' as http;
//
// class MyPostFunctions {
//   static registerUser(
//       String username, email, firstname, lastname, password, context) async {
//     String data = json.encode({
//       "username": username,
//       "email": email,
//       "first_name": firstname,
//       "last_name": lastname,
//       "password": password
//     });
//     http.Response response =
//         await http.post("https://otwapi.herokuapp.com/api/auth/register");
//     if (response.statusCode < 210) {
//       print("Successful");
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => LoginPage(),
//         ),
//       );
//       Toast.show(
//         'You have registered successfully. You can Login now!',
//         context,
//         gravity: Toast.BOTTOM,
//         duration: Toast.LENGTH_LONG,
//       );
//     } else {
//       print(response.body);
//       Toast.show('Sorry something went Wrong. Try again!', context,
//           duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
//     }
//   }
// }
