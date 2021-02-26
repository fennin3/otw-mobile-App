import 'package:flutter/material.dart';
import 'package:otw/screens/landing.dart';
import 'package:otw/screens/messenger.dart';
import 'package:otw/screens/stories.dart';
import 'package:otw/screens/winners.dart';

class BottomNavWidget extends StatelessWidget {
  final shape;
  final Function storiesFunction;

  BottomNavWidget({this.shape, this.storiesFunction});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      shape: shape,
      child: Container(
        height: 37,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Row(
            //   children: [
            // SizedBox(
            //   width: 20,
            // ),
            IconButton(
                icon: Icon(
                  Icons.home,
                  size: 23,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LandingPage(),
                    ),
                    (route) => false,
                  );
                }),
            //   ],
            // ),
            IconButton(
                icon: Icon(
                  Icons.emoji_events,
                  size: 23,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WinnersPage(),
                    ),
                  );
                }),
            Card(
              child: Icon(
                Icons.add,
                size: 25,
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.ondemand_video,
                  size: 23,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StoriesPage(),
                    ),
                  );
                }),
            // Row(
            //   children: [
            IconButton(
                icon: Icon(
                  Icons.message,
                  size: 23,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MessengerAllPage(),
                    ),
                  );
                }),
            //     SizedBox(
            //       width: 20,
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
