import 'package:flutter/material.dart';
import 'package:otw/components/bottom_nav_bar.dart';
import 'package:otw/screens/user_profile_page.dart';

class ExploreUsers extends StatefulWidget {
  @override
  _ExploreUsersState createState() => _ExploreUsersState();
}

class _ExploreUsersState extends State<ExploreUsers> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                Expanded(
                  child: Card(
                    color: Colors.white70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: null,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.close),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var i in [1, 2, 3, 4, 5, 6, 7, 8, 9])
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.teal,
                              ),
                              title: Text("User Name"),
                              subtitle: Text("User Nickname"),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavWidget(),
    );
  }
}
