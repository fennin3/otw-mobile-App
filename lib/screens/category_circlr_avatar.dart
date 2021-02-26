import 'package:flutter/material.dart';
import 'package:otw/components/voting_cat_widget.dart';
import 'package:otw/screens/vote_category_page.dart';

class CategoryCircleAvatar extends StatelessWidget {
  final List categories;

  CategoryCircleAvatar({this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (var i in categories)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VoteCategoryPage(),
                    ),
                  );
                },
                child: VoteCategoryWidget(),
              ),
          ],
        ),
      ),
    );
  }
}
