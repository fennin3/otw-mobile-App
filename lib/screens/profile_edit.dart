import 'package:flutter/material.dart';
import 'package:otw/components/top_nav_bar.dart';
import 'package:otw/constants.dart';

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              TopNavBar(
                title: "Profile Edit",
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      decoration:
                          textInputDecor.copyWith(labelText: "Enter Your Name"),
                      cursorColor: Colors.black,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      decoration: textInputDecor.copyWith(
                          labelText: "Enter Your Nickname"),
                      cursorColor: Colors.black,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(

                      decoration: textInputDecor.copyWith(
                          labelText: "Enter Your Institution's name"),
                      cursorColor: Colors.black,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      decoration: textInputDecor.copyWith(
                          labelText: "Enter Your Programme"),
                      cursorColor: Colors.black,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      decoration: textInputDecor.copyWith(
                          labelText: "Enter Your Level"),
                      cursorColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
