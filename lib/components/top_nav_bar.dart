import 'package:flutter/material.dart';

class TopNavBar extends StatelessWidget {
  final String title;
  final bool needed;
  final bool proPic;
  final profileScreen;

  TopNavBar({this.title, this.needed, this.proPic, this.profileScreen});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            if (profileScreen != null)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => profileScreen,
                ),
              );
          },
          child: Row(
            children: [
              if (proPic == true)
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              Text(
                title,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        if (needed != false)
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.check,
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          )
        else
          SizedBox(
            width: 30,
          ),
      ],
    );
  }
}
