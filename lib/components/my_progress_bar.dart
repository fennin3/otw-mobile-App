import 'package:flutter/material.dart';

class MyProgressBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.white,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
    );
  }
}
