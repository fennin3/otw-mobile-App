import 'package:flutter/cupertino.dart';
import 'package:otw/database/database.dart';
import 'package:otw/database/utility.dart';
import 'package:otw/http_get.dart';
import 'package:otw/model/post_model.dart';
import 'package:otw/provider/models.dart';

class WeeklyPostProvider with ChangeNotifier {
  List<WeeklyPost> posts;
  bool loading = false;

  getPostsFromApiOrDb(context) async {
    loading = true;
    print("Still running");
    try {
      posts = await MyGetFunctions.getWeeklyPost();
    } catch (e) {
      final _db = DBHelper();
      List<Post> _data = await _db.getPosts();
      List<WeeklyPost> _data2 = [];
      for (var i in _data) {
        _data2.add(
          WeeklyPost(
              category: Category(
                  id: int.parse(i.categoryId),
                  name: i.categoryName,
                  thumbnail: ""),
              id: int.parse(i.postIdApi),
              datePosted: "",
              image: Utility.base64String(i.picture),
              person: Person(
                id: int.parse(i.userId),
                firstName: "",
                lastName: "",
                profile: Profile(),
              ),
              ratings: [
                Ratings(
                  id: int.parse(''),
                  stars: double.parse(i.rating),
                  post: int.parse(i.postIdApi),
                  rater: int.parse(i.userId),
                ),
              ]),
        );
      }
      posts = _data2;
    }

    loading = false;
    print(loading);
    print("finished");

    notifyListeners();
    Future.delayed(Duration(seconds: 5));
  }
}
