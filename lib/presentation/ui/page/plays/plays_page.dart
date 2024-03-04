import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:greethy_application/presentation/ui/page/plays/plays_page_bottom_bar_view.dart';
import 'package:greethy_application/presentation/ui/page/plays/profile_screen.dart';
import 'package:greethy_application/presentation/ui/page/plays/search_screen.dart';
import 'package:greethy_application/zdataDev/video.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';
import 'local_widget/plays_page_kudos_send_mess_view.dart';
import 'local_widget/plays_page_left_header_view.dart';
import 'local_widget/plays_page_message_view.dart';
import 'local_widget/plays_page_right_header_view.dart';
import 'local_widget/song.dart';
import 'state/feed_viewmodel.dart';
import 'messages_screen.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final locator = GetIt.instance;
  final FeedViewModel feedViewModel = GetIt.instance<FeedViewModel>();

  @override
  void initState() {
    print("init video");
    feedViewModel.loadVideo(0);
    feedViewModel.loadVideo(1);

    super.initState();
  }

  @override
  void dispose() {
    feedViewModel.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedViewModel>.reactive(
      disposeViewModel: false,
      builder: (context, model, child) => videoScreen(),
      viewModelBuilder: () => feedViewModel,
    );
  }

  Widget videoScreen() {
    return Scaffold(
      // backgroundColor: GetIt.instance<FeedViewModel>().actualScreen == 0 ? Colors.black : Colors.white,
      backgroundColor: feedViewModel.actualScreen == 0 ? Colors.black : Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: 2,
            onPageChanged: (value) {
              print("on page change: " + value.toString());
              if (value == 1)
                SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
              // else
              //   // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
            },
            itemBuilder: (context, index) {
              print("check itemBuilder: $index");
              if (index == 0) {
                print("scrollFeed");
                return scrollFeed();
              } else {
                print("profileView");
                return profileView();
              }
            },
          )
        ],
      ),
    );
  }

  Widget profileView() {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12))),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios),
                    Text(
                      "Charlotte Stone",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.more_horiz)
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: "https://www.andersonsobelcosmetic.com/wp-content/uploads/2018/09/chin-implant-vs-fillers-best-for-improving-profile-bellevue-washington-chin-surgery.jpg",
                          height: 100.0,
                          width: 100.0,
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "@Charlotte21",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "232",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Following",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.black54,
                        width: 1,
                        height: 15,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      Column(
                        children: [
                          Text(
                            "1.3k",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Followers",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.black54,
                        width: 1,
                        height: 15,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      Column(
                        children: [
                          Text(
                            "12k",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Likes",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 140,
                        height: 47,
                        decoration: BoxDecoration(
                          color: Colors.pink[500],
                        ),
                        child: Center(
                          child: Text(
                            "Follow",
                            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 45,
                        height: 47,
                        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
                        child: Center(child: Icon(Icons.camera_alt)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 35,
                        height: 47,
                        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
                        child: Center(child: Icon(Icons.arrow_drop_down)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.menu),
                            SizedBox(
                              height: 7,
                            ),
                            Container(
                              color: Colors.black,
                              height: 2,
                              width: 55,
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.black26,
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Container(
                              color: Colors.transparent,
                              height: 2,
                              width: 55,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(color: Colors.black26, border: Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: "https://media.giphy.com/media/tOueglJrk5rS8/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(color: Colors.black26, border: Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: "https://media.giphy.com/media/665IPY24jyWFa/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(color: Colors.black26, border: Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: "https://media.giphy.com/media/chjX2ypYJKkr6/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(color: Colors.black26, border: Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: "https://media.giphy.com/media/sC60eX0OVIH7O/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(color: Colors.black26, border: Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: "https://media.giphy.com/media/NsXhybxnMKsh2/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(color: Colors.black26, border: Border.all(color: Colors.white70, width: .5)),
                          child: FittedBox(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: "https://media.giphy.com/media/HE6hyf47yAX1S/giphy.gif",
                              placeholder: (context, url) => Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget scrollFeed() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(child: currentScreen()),
        BottomBar(context: context),
      ],
    );
  }

  Widget feedVideos() {
    print("length listVideos: " + feedViewModel.videoSource!.listVideos.length.toString());
    return Stack(
      children: [
        PageView.builder(
          controller: PageController(
            initialPage: 0,
            viewportFraction: 1,
          ),
          itemCount: feedViewModel.videoSource?.listVideos.length,
          onPageChanged: (index) {
            index = (index % (feedViewModel.videoSource!.listVideos.length)) as int;
            feedViewModel.changeVideo(index);
          },
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            index = (index % (feedViewModel.videoSource!.listVideos.length)) as int;
            return videoCard(feedViewModel.videoSource!.listVideos[index]);
          },
        ),
        SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                CustomHeader(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget currentScreen() {
    print("currentScreen: " + feedViewModel.actualScreen.toString());
    switch (feedViewModel.actualScreen) {
      case 0:
        return feedVideos();
      case 1:
        return SearchScreen();
      case 2:
        return MessagesScreen();
      case 3:
        return ProfileScreen();
      default:
        return feedVideos();
    }
  }

  Widget videoCard(VideoTiktok video) {
    return Stack(
      children: [
        ///video controller
        video.controller != null
            ? GestureDetector(
                onTap: () {
                  if (video.controller!.value.isPlaying) {
                    video.controller?.pause();
                  } else {
                    video.controller?.play();
                  }
                },
                child: SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: video.controller?.value.size.width ?? 0,
                      height: video.controller?.value.size.height ?? 0,
                      child: VideoPlayer(video.controller!),
                    ),
                  ),
                ),
              )
            : Container(
                color: Colors.black,
                child: Center(
                  child: Text("Loading"),
                ),
              ),

        /// message - Kudos bar
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            ExpandableText(
                text:
                    "Detector và một Container để đảm nhận mọi trạng thái của nội dung (mở rộng và thu gọn). Sử dụng FittedBox và thuộc tính width của Container, chúng ta có thể điều chỉnh kích thước Text để nội dung tự động xuống dòng khi cần thiếtĐồng thời, chúng ta sử dụng thuộc tính maxLines và overflow của Text để xử lý việc hiển thị nội dung bị cắt ngắn khi đượ"),
            ActionsToolbar(
              video.likes,
              video.comments,
              "https://www.andersonsobelcosmetic.com/wp-content/uploads/2018/09/chin-implant-vs-fillers-best-for-improving-profile-bellevue-washington-chin-surgery.jpg",
            ),
            VideoDescription(
              video.songName,
              "https://www.andersonsobelcosmetic.com/wp-content/uploads/2018/09/chin-implant-vs-fillers-best-for-improving-profile-bellevue-washington-chin-surgery.jpg",
            ),
            SizedBox(height: 12)
          ],
        ),

        ///header
        SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: <Widget>[
            child: HeaderToolbar(
              userPic: "https://www.andersonsobelcosmetic.com/wp-content/uploads/2018/09/chin-implant-vs-fillers-best-for-improving-profile-bellevue-washington-chin-surgery.jpg",
              like: video.likes,
            ),
            // ],
            // ),
          ),
        ),
      ],
    );
  }
}
