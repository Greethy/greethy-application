import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/theme/theme.dart';

class ActionsToolbar extends StatelessWidget {
  // Full dimensions of an action
  static const double ActionWidgetSize = 60.0;

// The size of the icon showen for Social Actions
  static const double ActionIconSize = 35.0;

// The size of the share social icon
  static const double ShareActionIconSize = 25.0;

// The size of the profile image in the follow Action
  static const double ProfileImageSize = 50.0;

// The size of the plus icon under the profile image in follow action
  static const double PlusIconSize = 20.0;

  final String numLikes;
  final String numComments;
  final String userPic;

  ActionsToolbar(this.numLikes, this.numComments, this.userPic);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 12, 10, 0),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red.withOpacity(0.7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                height: 35,
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(0.7),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Gửi tin nhắn...',
                    hintStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 2 - 40,
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey.withOpacity(0.7),
              ),
              child: Center(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: <Widget>[
                    _getSocialAction(icon: TikTokIcons.heart, title: numLikes),
                    _getSocialAction(icon: TikTokIcons.chat_bubble, title: numComments),
                    _getSocialAction(icon: TikTokIcons.heart, title: numLikes),
                    _getSocialAction(icon: TikTokIcons.chat_bubble, title: numComments),
                    _getSocialAction(icon: TikTokIcons.heart, title: numLikes),
                    _getSocialAction(icon: TikTokIcons.chat_bubble, title: numComments),
                    _getSocialAction(icon: TikTokIcons.heart, title: numLikes),
                    _getSocialAction(icon: TikTokIcons.chat_bubble, title: numComments),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getSocialAction({required String title, required IconData icon, bool isShare = false}) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: isShare ? 20.0 : 25.0,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }

  Widget _getFollowAction({required String pictureUrl}) {
    return Container(margin: EdgeInsets.symmetric(vertical: 10.0), width: 70.0, height: 70.0, child: Stack(children: [_getProfilePicture(pictureUrl), _getPlusIcon()]));
  }

  Widget _getPlusIcon() {
    return Positioned(
      bottom: 0,
      left: ((ActionWidgetSize / 2) - (PlusIconSize / 2)),
      child: Container(
          width: PlusIconSize, // PlusIconSize = 20.0;
          height: PlusIconSize, // PlusIconSize = 20.0;
          decoration: BoxDecoration(color: Color.fromARGB(255, 255, 43, 84), borderRadius: BorderRadius.circular(15.0)),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 20.0,
          )),
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

  LinearGradient get musicGradient => LinearGradient(colors: [Colors.grey[800]!, Colors.grey[900]!, Colors.grey[900]!, Colors.grey[800]!], stops: [0.0, 0.4, 0.6, 1.0], begin: Alignment.bottomLeft, end: Alignment.topRight);

  Widget _getMusicPlayerAction(userPic) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: ActionWidgetSize,
      height: ActionWidgetSize,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(11.0),
            height: ProfileImageSize,
            width: ProfileImageSize,
            decoration: BoxDecoration(gradient: musicGradient, borderRadius: BorderRadius.circular(ProfileImageSize / 2)),
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
}
