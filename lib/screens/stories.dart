import 'package:flutter/material.dart';
import 'package:otw/components/stories_top_nav.dart';
import 'package:otw/components/stories_widget.dart';
import 'package:otw/components/user_story.dart';

class StoriesPage extends StatelessWidget {
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
              StoryTopNavWidget(),
              Divider(),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Stack(
                                    overflow: Overflow.visible,
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: -10,
                                        child: Card(
                                          color: Colors.black,
                                          elevation: 10,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                UserStories(),
                                UserStories(),
                                UserStories(),
                                UserStories(),
                                UserStories(),
                                UserStories(),
                                UserStories(),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        StoryWidget(),
                        StoryWidget(),
                        StoryWidget(),
                        StoryWidget(),
                        StoryWidget(),
                        StoryWidget(),
                        StoryWidget(),
                        StoryWidget(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
