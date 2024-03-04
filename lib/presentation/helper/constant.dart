class Constants {
  static String dummyProfilePic = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6TaCLCqU4K0ieF27ayjl51NmitWaJAh_X0r1rLX4gMvOe0MDaYw&s';
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
