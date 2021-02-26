import 'package:flutter/material.dart';
import 'package:otw/components/top_nav_bar.dart';
import 'package:otw/screens/message_main.dart';

class MessengerAllPage extends StatelessWidget {
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
                title: "Messenger",
                needed: false,
              ),
              Divider(),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.0),
                    child: ListView.builder(
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MessageMain(),
                            ),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.teal,
                            ),
                            title: Text("Username $index"),
                            subtitle: Text("New message from username $index"),
                            trailing: Text("6:30 pm"),
                          ),
                        );
                      },
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
