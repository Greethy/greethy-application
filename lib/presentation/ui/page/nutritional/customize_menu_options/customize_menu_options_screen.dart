import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/nutrition/customize_menu_option_screen.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/common/splash.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/customize_menu_options/members_list_menu_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/customize_menu_options/setting_menu_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/eating_menu_screen/widget/quote_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/widget/footnote_view.dart';
import 'package:provider/provider.dart';

class CustomizeMenuOptionsScreen extends StatefulWidget {
  const CustomizeMenuOptionsScreen({
    Key? key,
    required this.foodId,
  }) : super(key: key);

  final String foodId;

  static MaterialPageRoute getRoute({required String foodId}) {
    return MaterialPageRoute(
      builder: (_) => Provider(
        create: (_) => CustomizeMenuOptionScreenState(foodId: foodId),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => CustomizeMenuOptionScreenState(foodId: foodId),
          builder: (_, child) => CustomizeMenuOptionsScreen(
            foodId: foodId,
          ),
        ),
      ),
    );
  }

  @override
  _CustomizeMenuOptionsScreenState createState() => _CustomizeMenuOptionsScreenState();
}

class _CustomizeMenuOptionsScreenState extends State<CustomizeMenuOptionsScreen> with TickerProviderStateMixin {
  AnimationController? animationController;

  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  String selectedCourse = '';
  String selectedLocation = '';

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
    // animation view page
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController!,
      curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn),
    ));

    // scroll listener
    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 && scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<CustomizeMenuOptionScreenState>(context, listen: false);
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(state),
            getAppBarUI(state),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI(CustomizeMenuOptionScreenState state) {
    return Consumer<CustomizeMenuOptionScreenState>(
      builder: (context, state, _) {
        return FutureBuilder<bool>(
          future: getData(state),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return DefaultTabController(
                length: 2,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top + 30,
                    bottom: 62 + MediaQuery.of(context).padding.bottom,
                  ),
                  child: Scaffold(
                    appBar: const TabBar(
                      indicatorColor: GreethyColor.kawa_green,
                      tabs: <Widget>[
                        Tab(child: Text('Tùy Chỉnh')),
                        Tab(child: Text('Thành Viên')),
                      ],
                    ),
                    body: TabBarView(
                      children: [
                        ListView.builder(
                          controller: scrollController,
                          itemCount: listViews.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            animationController?.forward();
                            return listViews[index];
                          },
                        ),
                        ListView.builder(
                          controller: scrollController,
                          itemCount: listViews.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            animationController?.forward();
                            return listViews[index];
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }

  Future<void> addAllListData() async {
    var state = Provider.of<CustomizeMenuOptionScreenState>(context, listen: false);
    listViews = [];

    listViews.add(
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '2 lựa chọn Tùy chỉnh',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Duyệt các kênh (44)'),
              leading: Icon(Icons.tv),
              onTap: () {
                // Handle channel browsing logic here
              },
            ),
            SizedBox(height: 20),
            Text(
              'Câu hỏi Tùy chỉnh',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Hãy chọn khóa học mà bạn tham gia 2024:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: <Widget>[
                ChoiceChip(
                  label: Text('PM'),
                  selected: selectedCourse == 'PM',
                  onSelected: (selected) {
                    setState(() {
                      selectedCourse = selected ? 'PM' : '';
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('DA'),
                  selected: selectedCourse == 'DA',
                  onSelected: (selected) {
                    setState(() {
                      selectedCourse = selected ? 'DA' : '';
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('UX'),
                  selected: selectedCourse == 'UX',
                  onSelected: (selected) {
                    setState(() {
                      selectedCourse = selected ? 'UX' : '';
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('DM'),
                  selected: selectedCourse == 'DM',
                  onSelected: (selected) {
                    setState(() {
                      selectedCourse = selected ? 'DM' : '';
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('IT'),
                  selected: selectedCourse == 'IT',
                  onSelected: (selected) {
                    setState(() {
                      selectedCourse = selected ? 'IT' : '';
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Bạn đang sinh sống và làm việc ở gần khu vực nào?',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: <Widget>[
                ChoiceChip(
                  label: Text('Hà Nội'),
                  selected: selectedLocation == 'Hà Nội',
                  onSelected: (selected) {
                    setState(() {
                      selectedLocation = selected ? 'Hà Nội' : '';
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Đà Nẵng'),
                  selected: selectedLocation == 'Đà Nẵng',
                  onSelected: (selected) {
                    setState(() {
                      selectedLocation = selected ? 'Đà Nẵng' : '';
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Hồ Chí Minh'),
                  selected: selectedLocation == 'Hồ Chí Minh',
                  onSelected: (selected) {
                    setState(() {
                      selectedLocation = selected ? 'Hồ Chí Minh' : '';
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Khác'),
                  selected: selectedLocation == 'Khác',
                  onSelected: (selected) {
                    setState(() {
                      selectedLocation = selected ? 'Khác' : '';
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );

    listViews.add(
      QuoteScreen(),
    );

    listViews.add(
      FootnoteView(),
    );
  }

  Future<bool> getData(CustomizeMenuOptionScreenState state) async {
    await state.initDatabase();
    addAllListData();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget getAppBarUI(CustomizeMenuOptionScreenState state) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animationController!,
          child: Transform(
            transform: Matrix4.translationValues(0.0, 30 * (1.0 - animationController!.value), 0.0),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: GreethyColor.kawa_green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: SafeArea(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: AppTheme.white,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "GREETHY FOOD",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                          onTap: () {
                            print("thả tim");
                          },
                          child: Center(
                            child: Icon(
                              Icons.heart_broken,
                              color: AppTheme.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
