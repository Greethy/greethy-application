import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'circle_image_animation.dart';

class VideoDescription extends StatelessWidget {
  final String songInfo;
  final String songPic;

  VideoDescription(this.songInfo, this.songPic);

  static const double ActionWidgetSize = 54;

// The size of the profile image in the follow Action
  static const double SongImageSize = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 120.0,
        padding: EdgeInsets.fromLTRB(20.0, 0, 10.0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.music_note,
                      size: 15.0,
                      color: Colors.white,
                    ),
                    Text(songInfo, style: TextStyle(color: Colors.white, fontSize: 14.0))
                  ],
                ),
                SizedBox(
                  height: 18,
                )
              ],
            ),
            CircleImageAnimation(
              child: _getMusicPlayerAction(songPic),
            )
          ],
        ),
      // ),
    );
  }

  Widget _getMusicPlayerAction(userPic) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: ActionWidgetSize,
      height: ActionWidgetSize,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(11.0),
            height: SongImageSize,
            width: SongImageSize,
            decoration: BoxDecoration(gradient: musicGradient, borderRadius: BorderRadius.circular(SongImageSize / 2)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10000.0),
              child: CachedNetworkImage(
                imageUrl: userPic,
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
          ),
        ],
      ),
    );
  }

  LinearGradient get musicGradient => LinearGradient(
        colors: [Colors.grey[800]!, Colors.grey[900]!, Colors.grey[900]!, Colors.grey[800]!],
        stops: [0.0, 0.4, 0.6, 1.0],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      );
}
