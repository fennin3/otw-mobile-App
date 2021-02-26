import 'package:flutter/material.dart';
import 'package:otw/components/top_nav_bar.dart';
import 'package:otw/screens/user_profile_page.dart';

class MessageMain extends StatefulWidget {
  @override
  _MessageMainState createState() => _MessageMainState();
}

class _MessageMainState extends State<MessageMain> {
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
                title: "User name",
                needed: false,
                proPic: true,
                profileScreen: ProfilePage(),
              ),
              Divider(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.black12,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        minWidth: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.55),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 5, top: 6, bottom: 10),
                                    child: Text(
                                        "Hello there! dhsh shdhs hsdn hyshd hshd shdh shd  hsdh "),
                                  ),
                                ),
                                Text(
                                  "6:30 pm",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        minWidth: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.55),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 5, top: 6, bottom: 10),
                                    child: Text(
                                      "Hello therggdgsg dgdsggdgsh dggsgd ggsgd gdgsg gsgd gsdh",
                                    ),
                                  ),
                                ),
                                Text(
                                  "6:30 pm",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        minWidth: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.55),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 5, top: 6, bottom: 10),
                                    child: Text(
                                        "Hello there! dhsh shdhs hsdn hyshd hshd shdh shd  hsdh "),
                                  ),
                                ),
                                Text(
                                  "6:30 pm",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        minWidth: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.55),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 5, top: 6, bottom: 10),
                                    child: Text(
                                      "Hello therggdgsg dgdsggdgsh dggsgd ggsgd gdgsg gsgd gsdh",
                                    ),
                                  ),
                                ),
                                Text(
                                  "6:30 pm",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        minWidth: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.55),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 5, top: 6, bottom: 10),
                                    child: Text(
                                        "Hello there! dhsh shdhs hsdn hyshd hshd shdh shd  hsdh "),
                                  ),
                                ),
                                Text(
                                  "6:30 pm",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        minWidth: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.55),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 5, top: 6, bottom: 10),
                                    child: Text(
                                      "Hello therggdgsg dgdsggdgsh dggsgd ggsgd gdgsg gsgd gsdh",
                                    ),
                                  ),
                                ),
                                Text(
                                  "6:30 pm",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        minWidth: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.55),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 5, top: 6, bottom: 10),
                                    child: Text(
                                        "Hello there! dhsh shdhs hsdn hyshd hshd shdh shd  hsdh "),
                                  ),
                                ),
                                Text(
                                  "6:30 pm",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        minWidth: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.55),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 5, top: 6, bottom: 10),
                                    child: Text(
                                      "Hello therggdgsg dgdsggdgsh dggsgd ggsgd gdgsg gsgd gsdh",
                                    ),
                                  ),
                                ),
                                Text(
                                  "6:30 pm",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        minWidth: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.55),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 5, top: 6, bottom: 10),
                                    child: Text(
                                        "Hello there! dhsh shdhs hsdn hyshd hshd shdh shd  hsdh "),
                                  ),
                                ),
                                Text(
                                  "6:30 pm",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        minWidth: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.55),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 5, top: 6, bottom: 10),
                                    child: Text(
                                      "Hello therggdgsg dgdsggdgsh dggsgd ggsgd gdgsg gsgd gsdh",
                                    ),
                                  ),
                                ),
                                Text(
                                  "6:30 pm",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        minWidth: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.55),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 5, top: 6, bottom: 10),
                                    child: Text(
                                        "Hello there! dhsh shdhs hsdn hyshd hshd shdh shd  hsdh "),
                                  ),
                                ),
                                Text(
                                  "6:30 pm",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        minWidth: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.55),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 5, top: 6, bottom: 10),
                                    child: Text(
                                      "Hello therggdgsg dgdsggdgsh dggsgd ggsgd gdgsg gsgd gsdh",
                                    ),
                                  ),
                                ),
                                Text(
                                  "6:30 pm",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        minWidth: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.55),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 5, top: 6, bottom: 10),
                                    child: Text(
                                        "Hello there! dhsh shdhs hsdn hyshd hshd shdh shd  hsdh "),
                                  ),
                                ),
                                Text(
                                  "6:30 pm",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        minWidth: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.55),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 5, top: 6, bottom: 10),
                                    child: Text(
                                      "Hello therggdgsg dgdsggdgsh dggsgd ggsgd gdgsg gsgd gsdh",
                                    ),
                                  ),
                                ),
                                Text(
                                  "6:30 pm",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        minWidth: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.55),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 5, top: 6, bottom: 10),
                                    child: Text(
                                        "Hello there! dhsh shdhs hsdn hyshd hshd shdh shd  hsdh "),
                                  ),
                                ),
                                Text(
                                  "6:30 pm",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        minWidth: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.55),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 5, top: 6, bottom: 10),
                                    child: Text(
                                      "Hello therggdgsg dgdsggdgsh dggsgd ggsgd gdgsg gsgd gsdh",
                                    ),
                                  ),
                                ),
                                Text(
                                  "6:30 pm",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black54,
                padding: EdgeInsets.only(right: 10, left: 10, bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                           padding: EdgeInsets.only(left: 10),
                          child: Center(
                            child: TextField(

                              decoration: InputDecoration(
                                hintText: "Type a message",

                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                              ),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Icon(
                              Icons.send,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
