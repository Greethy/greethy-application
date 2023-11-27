import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'expandabl_text.dart';

class HeaderToolbar extends StatelessWidget {
  // Full dimensions of an action
  static const double ActionWidgetSize = 60.0;

// The size of the profile image in the follow Action
  static const double ProfileImageSize = 40.0;

// The size of the plus icon under the profile image in follow action
  static const double PlusIconSize = 20.0;
  final String userPic;

  HeaderToolbar(this.userPic);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100.0,
      // height: 100.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getFollowAction(pictureUrl: userPic),
          Text(
            'ChunhThanhDe',
            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black.withOpacity(0.7),
            ),
            child: FittedBox(
              child: Container(
                width: 250, // Đảm bảo nội dung tự động xuống dòng khi vượt quá giới hạn
                child: Text(
                  "Trong đoạn mã trên, FittedBox được sử dụng để tự nh dạng viềnt theo ý muốn trong đoạn mã trên.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          ExpandableText(
            text: "Trong đoạn mã trên, FittedBox được sử dụng để tự nh dạng viềnt theo ý muốn trong đoạn mã trên.",
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget _getFollowAction({required String pictureUrl}) {
    return Container(
      width: 50.0,
      height: 50.0,
      child: Stack(
        children: [
          _getProfilePicture(pictureUrl),
        ],
      ),
    );
  }

  Widget _getProfilePicture(userPic) {
    return Positioned(
        left: (ActionWidgetSize / 2) - (ProfileImageSize / 2),
        child: Container(
            padding: EdgeInsets.all(1.0),
            // Add 1.0 point padding to create border
            height: ProfileImageSize,
            // ProfileImageSize = 50.0;
            width: ProfileImageSize,
            // ProfileImageSize = 50.0;
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(ProfileImageSize / 2)),
            // import 'package:cached_network_image/cached_network_image.dart'; at the top to use CachedNetworkImage
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10000.0),
                child: CachedNetworkImage(
                  imageUrl: userPic,
                  placeholder: (context, url) => new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ))));
  }
}
