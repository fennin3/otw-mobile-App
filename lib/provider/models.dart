class WeeklyPost {
  int id;
  List<Ratings> ratings;
  Category category;
  Person person;
  String image;
  String datePosted;
  int weekNumber;

  WeeklyPost(
      {this.id,
        this.ratings,
        this.category,
        this.person,
        this.image,
        this.datePosted,
        this.weekNumber});

  WeeklyPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['ratings'] != null) {
      ratings = [];
      json['ratings'].forEach((v) {
        ratings.add(new Ratings.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    person =
    json['person'] != null ? new Person.fromJson(json['person']) : null;
    image = json['image'];
    datePosted = json['date_posted'];
    weekNumber = json['week_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.ratings != null) {
      data['ratings'] = this.ratings.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.person != null) {
      data['person'] = this.person.toJson();
    }
    data['image'] = this.image;
    data['date_posted'] = this.datePosted;
    data['week_number'] = this.weekNumber;
    return data;
  }
}

class Ratings {
  int id;
  double stars;
  int post;
  int rater;

  Ratings({this.id, this.stars, this.post, this.rater});

  Ratings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stars = json['stars'];
    post = json['post'];
    rater = json['rater'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stars'] = this.stars;
    data['post'] = this.post;
    data['rater'] = this.rater;
    return data;
  }
}

class Category {
  int id;
  String name;
  String thumbnail;

  Category({this.id, this.name, this.thumbnail});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class Person {
  int id;
  String firstName;
  String lastName;
  Profile profile;

  Person({this.id, this.firstName, this.lastName, this.profile});

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    return data;
  }
}

class Profile {
  int id;
  Null nickname;
  Null image;
  Null institution;
  Null programmeOfStudies;
  Null level;

  Profile(
      {this.id,
        this.nickname,
        this.image,
        this.institution,
        this.programmeOfStudies,
        this.level});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickname = json['nickname'];
    image = json['image'];
    institution = json['institution'];
    programmeOfStudies = json['programme_of_studies'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nickname'] = this.nickname;
    data['image'] = this.image;
    data['institution'] = this.institution;
    data['programme_of_studies'] = this.programmeOfStudies;
    data['level'] = this.level;
    return data;
  }
}
