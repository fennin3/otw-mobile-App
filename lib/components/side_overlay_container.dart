import 'package:flutter/material.dart';
import 'package:otw/components/cat_overlay.dart';
import 'package:otw/components/voting_cat_widget.dart';
import 'package:otw/http_get.dart';
import 'package:otw/screens/category_circlr_avatar.dart';
import 'package:shimmer/shimmer.dart';

class MyOverlayContainer extends StatelessWidget {
  const MyOverlayContainer({
    Key key,
    @required bool dropdownShown,
  })  : _dropdownShown = dropdownShown,
        super(key: key);

  final bool _dropdownShown;

  @override
  Widget build(BuildContext context) {
    return OverlayContainer(
      show: _dropdownShown,
      // Let's position this overlay to the right of the button.
      position: OverlayContainerPosition(0.0, 70.0),
      child: Container(
        height: 400,
        padding: EdgeInsets.only(left: 10, top: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1,
              spreadRadius: 1,
            )
          ],
        ),
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: MyGetFunctions.getCategories(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
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
        ),
      ),
    );
  }
}
