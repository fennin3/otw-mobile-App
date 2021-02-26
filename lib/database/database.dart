import 'dart:async';
import 'dart:io' as io;
import 'dart:typed_data';
import 'package:otw/model/post_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  //Creating a database with name test.dn in your directory
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "otw.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  // Creating a table name Post with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
      "CREATE TABLE Post(id INTEGER PRIMARY KEY, postidapi TEXT,  user_id TEXT, category_name TEXT, category_id TEXT, week_no TEXT,rating TEXT, image BLOB)",
    );
    print("Created tables");
  }

  // Retrieving posts from Post Tables
  Future<List<Post>> getPosts() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Post');
    List<Post> posts = [];
    for (int i = 0; i < list.length; i++) {
      posts.add(
        Post(
          categoryId: list[i]['category_id'],
          categoryName: list[i]['category_name'],
          picture: Uint8List.fromList(list[i]['image'].codeUnits),
          rating: list[i]['rating'],
          userId: list[i]['user_id'],
          weekNo: list[i]['week_no'],
          dbId: list[i]['id'].toString(),
          postIdApi: list[i]['postidapi'].toString(),
        ),
      );
    }
    print("Total post =>> ${posts.length}");
    return posts;
  }

  // void savePost(Post post) async {
  //   var dbClient = await db;
  //   await dbClient.transaction((txn) async {
  //     return await txn.rawInsert(
  //         'INSERT INTO Post(postidapi, user_id, category_name, category_id, week_no, rating, image) VALUES(' +
  //             '\'' +
  //             post.postIdApi +
  //             '\'' +
  //             ',' +
  //             '\'' +
  //             post.userId +
  //             '\'' +
  //             ',' +
  //             '\'' +
  //             post.categoryName +
  //             '\'' +
  //             ',' +
  //             '\'' +
  //             post.categoryId +
  //             '\'' +
  //             ',' +
  //             '\'' +
  //             post.weekNo +
  //             '\'' +
  //             ',' +
  //             '\'' +
  //             post.rating +
  //             '\'' +
  //             ',' +
  //             '\'' +
  //             post.picture.toString() +
  //             '\'' +
  //             ')');
  //   });
  // }

  savePost(Post post) async {
    final dbClient = await db;
    await dbClient.insert(
      'Post',
      {
        "postidapi": post.postIdApi,
        "user_id": post.userId,
        "category_name": post.categoryName,
        "category_id": post.categoryId,
        "week_no": post.weekNo,
        "rating": post.rating,
        "image": post.picture.toString()
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    getPosts();

  }

  delete() async{
    final dbClient = await db;
    dbClient.execute("DELETE FROM Post");
  }

  updateDog(Post post) async {
    // Get a reference to the database.
    final dbClient = await db;

    // Update the given Dog.
    await dbClient.update(
      'Post',
      {
        "postidapi": post.postIdApi,
        "user_id": post.userId,
        "category_name": post.categoryName,
        "category_id": post.categoryId,
        "week_no": post.weekNo,
        "rating": post.rating,
        "image": post.picture.toString()
      },

      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [post.dbId],
    );
  }
}
