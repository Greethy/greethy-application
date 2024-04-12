class Constants {
  static String dummyProfilePic = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6TaCLCqU4K0ieF27ayjl51NmitWaJAh_X0r1rLX4gMvOe0MDaYw&s';

  static String breakfast = "breakfast";
  static String snack = "snack";
  static String lunch = "lunch";
  static String dinner = "dinner";
  static String breakfastImg = "assets/fitness_app/breakfast.png";
  static String snackImg = "assets/fitness_app/snack.png";
  static String lunchImg = "assets/fitness_app/lunch.png";
  static String dinnerImg = "assets/fitness_app/dinner.png";
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
  FIRST_TIME,
}

enum TweetType {
  Tweet,
  Detail,
  Reply,
  ParentTweet,
}

enum SortUser {
  Verified,
  Alphabetically,
  Newest,
  Oldest,
  MaxFollower,
}

enum NotificationType {
  NOT_DETERMINED,
  Message,
  Tweet,
  Reply,
  Retweet,
  Follow,
  Mention,
  Like
}
