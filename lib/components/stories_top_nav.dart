import 'package:flutter/material.dart';

class StoryTopNavWidget extends StatelessWidget {
  const StoryTopNavWidget({
    Key key,
  }) : super(key: key);

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
        Text(
          "Stories",
          style: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
        ),
        Row(
          children: [
            Icon(Icons.search),
            SizedBox(
              width: 15,
            )
          ],
        )
      ],
    );
  }
}
