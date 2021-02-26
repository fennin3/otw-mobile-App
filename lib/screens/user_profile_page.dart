import 'package:flutter/material.dart';
import 'package:otw/screens/login.dart';
import 'package:otw/screens/message_main.dart';
import 'package:otw/screens/profile_edit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  final bool owner;

  ProfilePage({this.owner});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  SharedPreferences sharedPreferences;

  void showimagePickerModal() {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: GestureDetector(
                    child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.photo_library,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        "Select from gallery",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        "Take a picture",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )),
              ),
            ),
          );
        });
  }

  void initSharedPreferrences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initSharedPreferrences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 20),
                color: Colors.black,
                child: Card(
                  elevation: 10,
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      widget.owner ?? false
                                          ? GestureDetector(
                                              onTap: () {
                                                sharedPreferences.clear();
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        LoginPage(),
                                                  ),
                                                  (Route<dynamic> route) =>
                                                      false,
                                                );
                                              },
                                              child: Icon(
                                                Icons.logout,
                                                color: Colors.white,
                                              ),
                                            )
                                          : SizedBox(),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileEdit(),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.settings,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 65,
                                  backgroundColor: Colors.lightGreen,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      showimagePickerModal();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "User Name",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Nick Name",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Card(
                    elevation: 20,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.school),
                                title: Text("Institution"),
                                subtitle: Text("Name of Institution"),
                              ),
                              Divider()
                            ],
                          ),
                          Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.library_books_rounded),
                                title: Text("Programme"),
                                subtitle: Text("Name of Programme"),
                              ),
                              Divider()
                            ],
                          ),
                          Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.stacked_bar_chart),
                                title: Text("Level"),
                                subtitle: Text("Level 300"),
                              ),
                              Divider()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
        ),
        floatingActionButton: widget.owner ?? false
            ? null
            : FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MessageMain(),
                    ),
                  );
                },
                child: Icon(Icons.message),
                backgroundColor: Colors.black,
              ));
  }
}
