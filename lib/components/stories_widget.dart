import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5, bottom: 5),
          child: Row(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: Colors.yellowAccent,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "User Name",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          color: Colors.grey,
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
