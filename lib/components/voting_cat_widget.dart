import 'package:flutter/material.dart';

class VoteCategoryWidget extends StatelessWidget {
  final Color color;

  VoteCategoryWidget({this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: color ?? Colors.black,
                ),
              ),
              padding: EdgeInsets.all(3),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.teal,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '  Category 3',
              style: TextStyle(
                fontSize: 12,
              ),
            )
          ],
        ),
        SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
