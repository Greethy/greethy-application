import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/nutrition/customize_menu_option_screen_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/customize_menu_options/widget/card_pepple_in_plan_eating.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/customize_menu_options/widget/meal_rations_widget.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/eating_menu_screen/widget/quote_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/widget/footnote_view.dart';
import 'package:provider/provider.dart';

class CustomizeMenuOptionsScreen extends StatefulWidget {
  const CustomizeMenuOptionsScreen({
    required this.eatingPlanId,
    Key? key,
  }) : super(key: key);

  final String eatingPlanId;

  static MaterialPageRoute getRoute({required String eatingPlanId}) {
    return MaterialPageRoute(
      builder: (_) => Provider(
        create: (_) => CustomizeMenuOptionScreenState(eatingPlanId: eatingPlanId),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => CustomizeMenuOptionScreenState(eatingPlanId: eatingPlanId),
          builder: (_, child) => CustomizeMenuOptionsScreen(
            eatingPlanId: eatingPlanId,
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
  List<Widget> listViews2 = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  String selectedCourse = '';
  String selectedLocation = '';

  final List<Map<String, String>> users = [
    {
      'name': 'Nguyền Thành Chung',
      'imageUrl':
          'https://media.licdn.com/dms/image/D5603AQE94bklZfqiEQ/profile-displayphoto-shrink_200_200/0/1692931978549?e=1726704000&v=beta&t=n7x5A8YIIp-CvgI9_VfawL4aJsMjyD2gTm_NTSsUBto',
    },
    {
      'name': 'Nguyễn Thành Kiên',
      'imageUrl':
          'https://media.licdn.com/dms/image/D5603AQFpiVWEvQi1pw/profile-displayphoto-shrink_200_200/0/1713514548758?e=1726704000&v=beta&t=Pmred_DWzX9S8oAqSZJeIR-Xbd0zQspI0lWfUoAfmPg',
    },
    // Thêm nhiều người dùng hơn ở đây
  ];

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
                  ),
                  child: Scaffold(
                    appBar: const TabBar(
                      indicatorColor: GreethyColor.kawa_green,
                      labelColor: GreethyColor.kawa_green,
                      tabs: <Widget>[
                        Tab(child: Text('Tùy Chỉnh')),
                        Tab(child: Text('Thành Viên')),
                      ],
                    ),
                    body: TabBarView(
                      children: [
                        ListView.builder(
                          controller: scrollController,
                          itemCount: listViews2.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            animationController?.forward();
                            return listViews2[index];
                          },
                        ),
                        ListView.builder(
                          controller: scrollController,
                          scrollDirection: Axis.vertical,

                          // itemCount: listViews.length,
                          // itemBuilder: (BuildContext context, int index) {
                          //   animationController?.forward();
                          //   return listViews[index];
                          // },

                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            return UserCard(
                              name: users[index]['name']!,
                              imageUrl: users[index]['imageUrl']!,
                            );
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
    // listViews.add(
    //   Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         Text(
    //           '2 lựa chọn Tùy chỉnh',
    //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //         ),
    //         SizedBox(height: 10),
    //         ListTile(
    //           title: Text('Duyệt các kênh (44)'),
    //           leading: Icon(Icons.tv),
    //           onTap: () {
    //             // Handle channel browsing logic here
    //           },
    //         ),
    //         SizedBox(height: 20),
    //         Text(
    //           'Câu hỏi Tùy chỉnh',
    //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //         ),
    //         SizedBox(height: 10),
    //         Text(
    //           'Hãy chọn khóa học mà bạn tham gia 2024:',
    //           style: TextStyle(fontSize: 16),
    //         ),
    //         SizedBox(height: 10),
    //         Wrap(
    //           spacing: 10,
    //           children: <Widget>[
    //             ChoiceChip(
    //               label: Text('PM'),
    //               selected: selectedCourse == 'PM',
    //               onSelected: (selected) {
    //                 setState(() {
    //                   selectedCourse = selected ? 'PM' : '';
    //                 });
    //               },
    //             ),
    //             ChoiceChip(
    //               label: Text('DA'),
    //               selected: selectedCourse == 'DA',
    //               onSelected: (selected) {
    //                 setState(() {
    //                   selectedCourse = selected ? 'DA' : '';
    //                 });
    //               },
    //             ),
    //             ChoiceChip(
    //               label: Text('UX'),
    //               selected: selectedCourse == 'UX',
    //               onSelected: (selected) {
    //                 setState(() {
    //                   selectedCourse = selected ? 'UX' : '';
    //                 });
    //               },
    //             ),
    //             ChoiceChip(
    //               label: Text('DM'),
    //               selected: selectedCourse == 'DM',
    //               onSelected: (selected) {
    //                 setState(() {
    //                   selectedCourse = selected ? 'DM' : '';
    //                 });
    //               },
    //             ),
    //             ChoiceChip(
    //               label: Text('IT'),
    //               selected: selectedCourse == 'IT',
    //               onSelected: (selected) {
    //                 setState(() {
    //                   selectedCourse = selected ? 'IT' : '';
    //                 });
    //               },
    //             ),
    //           ],
    //         ),
    //         SizedBox(height: 20),
    //         Text(
    //           'Bạn đang sinh sống và làm việc ở gần khu vực nào?',
    //           style: TextStyle(fontSize: 16),
    //         ),
    //         SizedBox(height: 10),
    //         Wrap(
    //           spacing: 10,
    //           children: <Widget>[
    //             ChoiceChip(
    //               label: Text('Hà Nội'),
    //               selected: selectedLocation == 'Hà Nội',
    //               onSelected: (selected) {
    //                 setState(() {
    //                   selectedLocation = selected ? 'Hà Nội' : '';
    //                 });
    //               },
    //             ),
    //             ChoiceChip(
    //               label: Text('Đà Nẵng'),
    //               selected: selectedLocation == 'Đà Nẵng',
    //               onSelected: (selected) {
    //                 setState(() {
    //                   selectedLocation = selected ? 'Đà Nẵng' : '';
    //                 });
    //               },
    //             ),
    //             ChoiceChip(
    //               label: Text('Hồ Chí Minh'),
    //               selected: selectedLocation == 'Hồ Chí Minh',
    //               onSelected: (selected) {
    //                 setState(() {
    //                   selectedLocation = selected ? 'Hồ Chí Minh' : '';
    //                 });
    //               },
    //             ),
    //             ChoiceChip(
    //               label: Text('Khác'),
    //               selected: selectedLocation == 'Khác',
    //               onSelected: (selected) {
    //                 setState(() {
    //                   selectedLocation = selected ? 'Khác' : '';
    //                 });
    //               },
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    listViews.add(
      QuoteScreen(),
    );

    listViews.add(
      FootnoteView(),
    );
  }

  Future<void> addAllListConfig() async {
    var state = Provider.of<CustomizeMenuOptionScreenState>(context, listen: false);
    listViews2 = [];

    listViews2.add(
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // _buildInfoRow('ID', state.nutritionManagement!.id.toString()),
                // _buildInfoRow('User ID', state.nutritionManagement!.ownId.toString()),
                // _buildInfoRow('Drink Plan ID', state.nutritionManagement!.drinkPlanId.toString()),
                // _buildInfoRow('Personal Eating Plan ID', state.nutritionManagement!.eatingPlanPersonalId.toString()),
                MealRationsWidget(meal: 'Số Món bữa Trưa', initialRations: state.nutritionManagement!.lunchRations),
                MealRationsWidget(meal: 'Số Món bữa Tối', initialRations: state.nutritionManagement!.dinnerRations),
                _buildInfoRow('Bữa phụ Sáng', state.nutritionManagement!.breakfastSnack! ? 'Yes' : 'No'),
                _buildInfoRow('Bữa phụ Chiều', state.nutritionManagement!.afternoonSnack! ? 'Yes' : 'No'),
                // _buildInfoRow('Collective Eating Plan Start Date', state.nutritionManagement!.eatingPlanCollective.toString()),
              ],
            ),
          ),
        ),
      ),
    );

    listViews2.add(
      Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: ElevatedButton(
          onPressed: () {
            // Hành động khi nhấn nút
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Đã Lưu!'),
                backgroundColor: GreethyColor.kawa_green,
              ),
            );

            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: GreethyColor.kawa_green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          ),
          child: Text('Lưu Cài Đặt'),
        ),
      ),
    );

    listViews2.add(
      QuoteScreen(),
    );

    listViews2.add(
      FootnoteView(),
    );
  }

  Future<bool> getData(CustomizeMenuOptionScreenState state) async {
    await state.initDatabase();
    addAllListData();
    addAllListConfig();
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

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: GreethyColor.kawa_green.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: GreethyColor.kawa_green,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  '$label : ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black.withOpacity(0.8),
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
