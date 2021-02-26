import 'package:flutter/material.dart';
import 'package:otw/components/top_nav_bar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class VoteCategoryPage extends StatefulWidget {
  @override
  _VoteCategoryPageState createState() => _VoteCategoryPageState();
}

class _VoteCategoryPageState extends State<VoteCategoryPage> {
  double rating = 0;

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
                title: "Category Name",
                needed: false,
              ),
              Divider(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: 15,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (var i in [1, 2, 3, 4, 5, 6, 7, 8, 9])
                          Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Category Name",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                "User Name",
                                                style: TextStyle(fontSize: 12),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                      halfFilledIconData: Icons.star_half,
                                      defaultIconData: Icons.star_border,
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
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
