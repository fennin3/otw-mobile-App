import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:otw/components/bottom_nav_bar.dart';
import 'package:otw/components/side_overlay_container.dart';
import 'package:otw/components/voting_cat_widget.dart';
import 'package:otw/database/database.dart';
import 'package:otw/http_get.dart';
import 'package:otw/model/post_model.dart';
import 'package:otw/provider/provider_classes.dart';
import 'package:otw/screens/category_circlr_avatar.dart';
import 'package:otw/screens/search_users.dart';
import 'package:otw/screens/user_profile_page.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double rating = 0;
  bool _dropdownShown = false;
  DBHelper _dbHelper;
  List<Post> posts = [];

  void _toggleDropdown() {
    setState(() {
      _dropdownShown = !_dropdownShown;
    });
  }

  void saveWeeklyPostToDB() async {
    _dbHelper = DBHelper();
    List postsFromApi;
    try {
      List postsFromApi = await MyGetFunctions.getWeeklyPost2();
      _dbHelper.delete();
    } catch (e) {}
    // try{
    for (Map post in postsFromApi) {
      await get(post['image']).then(
        (imagefile) =>
            _dbHelper.savePost(
          Post(
              weekNo: post['week_number'].toString(),
              userId: post['person']['id'].toString(),
              rating: post['ratings']
                  .where((rating) =>
                      rating['rater'].toString() ==
                      post['person']['id'].toString())
                  .toString(),
              categoryName: post['category']['name'],
              categoryId: post['category']['id'].toString(),
              picture: imagefile.bodyBytes),
        ),
      );
    }
    print("Saving data Complete");

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final _weeklypost = Provider.of<WeeklyPostProvider>(context);
    _weeklypost.getPostsFromApiOrDb(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveWeeklyPostToDB();
  }

  @override
  Widget build(BuildContext context) {
    final _weeklypost = Provider.of<WeeklyPostProvider>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(6),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(
                                owner: true,
                              ),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.person,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "OTW",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExploreUsers(),
                          ),
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () => _toggleDropdown(),
                        child: Icon(
                          Icons.control_point_duplicate,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      MyOverlayContainer(dropdownShown: _dropdownShown),
                      SizedBox(
                        height: 10,
                      ),
                      FutureBuilder(
                          future: MyGetFunctions.getCategories(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (var i in [1, 2, 3, 4, 5, 6, 7, 8, 9])
                                      Shimmer.fromColors(
                                          child: VoteCategoryWidget(),
                                          baseColor: Colors.grey[400],
                                          highlightColor: Colors.white)
                                  ],
                                ),
                              );
                              // return Text("Loading");
                            } else {
                              return CategoryCircleAvatar(
                                categories: snapshot.data,
                              );
                              // return Text("Loaded");
                            }
                          }),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Colors.black38,
                      ),

                      _weeklypost.posts == null
                          ? Column(
                              children: [
                                for (var i in [1, 2, 3, 4, 5, 6])
                                  Shimmer.fromColors(
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "Category Name",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12),
                                                          ),
                                                          Text(
                                                            "User Name",
                                                            style: TextStyle(
                                                                fontSize: 12),
                                                          ),
                                                          SizedBox(
                                                            height: 3,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 230,
                                              color: Colors.black38,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                SmoothStarRating(
                                                  allowHalfRating: true,
                                                  starCount: 5,
                                                  rating: rating,
                                                  onRated: (v) {
                                                    rating = v;
                                                    setState(() {});
                                                  },
                                                  size: 24.0,
                                                  isReadOnly: false,
                                                  filledIconData: Icons.star,
                                                  halfFilledIconData:
                                                      Icons.star_half,
                                                  defaultIconData:
                                                      Icons.star_border,
                                                  color: Colors.black87,
                                                  borderColor: Colors.black87,
                                                  spacing: 0.0,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      baseColor: Colors.grey[900],
                                      highlightColor: Colors.grey[100])
                              ],
                            )
                          : Column(
                              children: [
                                for (var i in _weeklypost.posts)
                                  Container(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "${i.category.name}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12),
                                                      ),
                                                      Text(
                                                        "${i.person.firstName} ${i.person.lastName}",
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 230,
                                          color: Colors.black38,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            SmoothStarRating(
                                              allowHalfRating: true,
                                              starCount: 5,
                                              rating: rating,
                                              onRated: (v) {
                                                rating = v;
                                                setState(() {});
                                              },
                                              size: 24.0,
                                              isReadOnly: false,
                                              filledIconData: Icons.star,
                                              halfFilledIconData:
                                                  Icons.star_half,
                                              defaultIconData:
                                                  Icons.star_border,
                                              color: Colors.black87,
                                              borderColor: Colors.black87,
                                              spacing: 0.0,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  )
                              ],
                            )
                      // FutureBuilder(
                      //     future: MyGetFunctions.getWeeklyPost(),
                      //     builder: (context, snapshot) {
                      //       if (!snapshot.hasData) {
                      //         return Column(
                      //           children: [
                      //             for (var i in [1, 2, 3, 4, 5, 6])
                      //               Shimmer.fromColors(
                      //                   child: Container(
                      //                     child: Column(
                      //                       children: [
                      //                         Padding(
                      //                           padding: EdgeInsets.symmetric(
                      //                               horizontal: 10),
                      //                           child: Column(
                      //                             children: [
                      //                               Row(
                      //                                 children: [
                      //                                   Column(
                      //                                     crossAxisAlignment:
                      //                                         CrossAxisAlignment
                      //                                             .start,
                      //                                     children: [
                      //                                       SizedBox(
                      //                                         height: 5,
                      //                                       ),
                      //                                       Text(
                      //                                         "Category Name",
                      //                                         style: TextStyle(
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .bold,
                      //                                             fontSize: 12),
                      //                                       ),
                      //                                       Text(
                      //                                         "User Name",
                      //                                         style: TextStyle(
                      //                                             fontSize: 12),
                      //                                       ),
                      //                                       SizedBox(
                      //                                         height: 3,
                      //                                       ),
                      //                                     ],
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ),
                      //                         Container(
                      //                           height: 230,
                      //                           color: Colors.black38,
                      //                         ),
                      //                         Row(
                      //                           mainAxisAlignment:
                      //                               MainAxisAlignment.start,
                      //                           children: [
                      //                             SizedBox(
                      //                               width: 10,
                      //                             ),
                      //                             SmoothStarRating(
                      //                               allowHalfRating: true,
                      //                               starCount: 5,
                      //                               rating: rating,
                      //                               onRated: (v) {
                      //                                 rating = v;
                      //                                 setState(() {});
                      //                               },
                      //                               size: 24.0,
                      //                               isReadOnly: false,
                      //                               filledIconData: Icons.star,
                      //                               halfFilledIconData:
                      //                                   Icons.star_half,
                      //                               defaultIconData:
                      //                                   Icons.star_border,
                      //                               color: Colors.black87,
                      //                               borderColor: Colors.black87,
                      //                               spacing: 0.0,
                      //                             ),
                      //                           ],
                      //                         ),
                      //                         SizedBox(
                      //                           height: 10,
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                   baseColor: Colors.grey[900],
                      //                   highlightColor: Colors.grey[100])
                      //           ],
                      //         );
                      //       } else {
                      //         return Column(
                      //           children: [
                      //             for (var i in [1, 2, 3, 4, 5, 6])
                      //               Container(
                      //                 child: Column(
                      //                   children: [
                      //                     Padding(
                      //                       padding: EdgeInsets.symmetric(
                      //                           horizontal: 10),
                      //                       child: Column(
                      //                         children: [
                      //                           Row(
                      //                             children: [
                      //                               Column(
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment
                      //                                         .start,
                      //                                 children: [
                      //                                   SizedBox(
                      //                                     height: 5,
                      //                                   ),
                      //                                   Text(
                      //                                     "Category Name",
                      //                                     style: TextStyle(
                      //                                         fontWeight:
                      //                                             FontWeight
                      //                                                 .bold,
                      //                                         fontSize: 12),
                      //                                   ),
                      //                                   Text(
                      //                                     "User Name",
                      //                                     style: TextStyle(
                      //                                         fontSize: 12),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: 3,
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                     Container(
                      //                       height: 230,
                      //                       color: Colors.black38,
                      //                     ),
                      //                     Row(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.start,
                      //                       children: [
                      //                         SizedBox(
                      //                           width: 10,
                      //                         ),
                      //                         SmoothStarRating(
                      //                           allowHalfRating: true,
                      //                           starCount: 5,
                      //                           rating: rating,
                      //                           onRated: (v) {
                      //                             rating = v;
                      //                             setState(() {});
                      //                           },
                      //                           size: 24.0,
                      //                           isReadOnly: false,
                      //                           filledIconData: Icons.star,
                      //                           halfFilledIconData:
                      //                               Icons.star_half,
                      //                           defaultIconData:
                      //                               Icons.star_border,
                      //                           color: Colors.black87,
                      //                           borderColor: Colors.black87,
                      //                           spacing: 0.0,
                      //                         ),
                      //                       ],
                      //                     ),
                      //                     SizedBox(
                      //                       height: 10,
                      //                     ),
                      //                   ],
                      //                 ),
                      //               )
                      //           ],
                      //         );
                      //       }
                      //     }),

                      // Container(
                      //   child: Column(
                      //     children: [
                      //       Padding(
                      //         padding: EdgeInsets.symmetric(horizontal: 10),
                      //         child: Column(
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 Column(
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     SizedBox(
                      //                       height: 5,
                      //                     ),
                      //                     Text(
                      //                       "Category Name",
                      //                       style: TextStyle(
                      //                           fontWeight: FontWeight.bold,
                      //                           fontSize: 12),
                      //                     ),
                      //                     Text(
                      //                       "User Name",
                      //                       style: TextStyle(fontSize: 12),
                      //                     ),
                      //                     SizedBox(
                      //                       height: 3,
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ],
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       Container(
                      //         height: 230,
                      //         color: Colors.black38,
                      //       ),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           SizedBox(
                      //             width: 10,
                      //           ),
                      //           SmoothStarRating(
                      //             allowHalfRating: true,
                      //             starCount: 5,
                      //             rating: rating,
                      //             onRated: (v) {
                      //               rating = v;
                      //               setState(() {});
                      //             },
                      //             size: 24.0,
                      //             isReadOnly: false,
                      //             filledIconData: Icons.star,
                      //             halfFilledIconData: Icons.star_half,
                      //             defaultIconData: Icons.star_border,
                      //             color: Colors.black87,
                      //             borderColor: Colors.black87,
                      //             spacing: 0.0,
                      //           ),
                      //         ],
                      //       ),
                      //       SizedBox(
                      //         height: 10,
                      //       ),
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.black,
      //   child: Icon(Icons.add),
      // ),
      bottomNavigationBar: BottomNavWidget(),
    );
  }
}
