import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserStories extends StatelessWidget {
  const UserStories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.black)),
        padding: EdgeInsets.all(3),
        child: CircleAvatar(
          radius: 30,
        ),
      ),
    );
  }
}