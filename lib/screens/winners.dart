import 'package:flutter/material.dart';
import 'package:otw/components/top_nav_bar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class WinnersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double rating = 4.5;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              TopNavBar(
                needed: false,
                title: "Winners",
              ),
              Divider(),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(

                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        for(var i in [1,2,3,4,5,6,7,8,9,10])
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Winner of (Category Name)",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "User name",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 240,
                                color: Colors.black38,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SmoothStarRating(
                                        allowHalfRating: true,
                                        starCount: 5,
                                        rating: rating,
                                        size: 24.0,
                                        isReadOnly: true,
                                        filledIconData: Icons.star,
                                        halfFilledIconData: Icons.star_half,
                                        defaultIconData: Icons.star_border,
                                        color: Colors.black87,
                                        borderColor: Colors.black87,
                                        spacing: 0.0,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("($rating)"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("2000 reations"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
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
