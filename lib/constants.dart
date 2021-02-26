import 'package:flutter/material.dart';

const textInputDecor = InputDecoration(
  labelStyle: TextStyle(color: Colors.black),
  border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ),
);

const textInputDecor2 = InputDecoration(
  labelStyle: TextStyle(color: Colors.white),
  border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  ),

);



const labelStyle = TextStyle(fontSize: 12, color: Colors.white);

const baseUrl = "https://otwapi.herokuapp.com/api/";