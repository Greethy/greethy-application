import 'package:flutter/material.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food.dart';
import 'package:greethy_application/presentation/state/nutrition/search_food_screen_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/search_food_screen/food_view_search.dart';
import 'package:provider/provider.dart';

class SearchListScreen extends StatefulWidget {
  const SearchListScreen({
    Key? key,
  }) : super(key: key);

  static MaterialPageRoute getRoute() {
    return MaterialPageRoute(
      builder: (_) => Provider(
        create: (_) => FoodSearchScreenState(),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => FoodSearchScreenState(),
          builder: (_, child) => SearchListScreen(),
        ),
      ),
    );
  }

  @override
  _SearchListScreenState createState() => _SearchListScreenState();
}

class _SearchListScreenState extends State<SearchListScreen> with TickerProviderStateMixin {
  List<String> items = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry', 'Fig', 'Grapes', 'Honeydew'];
  List<String> filteredItems = [];
  TextEditingController searchController = TextEditingController();

  final ScrollController scrollController = ScrollController();

  double topBarOpacity = 0.0;

  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    filteredItems = items;
    searchController.addListener(() {
      filterItems();
    });
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

    animationController = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
    // animation view page
  }

  void filterItems() {
    List<String> tempItems = [];
    tempItems.addAll(items);
    if (searchController.text.isNotEmpty) {
      tempItems.retainWhere((item) {
        return item.toLowerCase().contains(searchController.text.toLowerCase());
      });
    }
    setState(() {
      filteredItems = tempItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<FoodSearchScreenState>(context, listen: false);
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

  Future<bool> getData(FoodSearchScreenState state) async {
    return await state.initDatabase();
  }

  Widget getMainListViewUI(FoodSearchScreenState state) {
    return Consumer<FoodSearchScreenState>(
      builder: (context, state, _) {
        return FutureBuilder<bool>(
          future: getData(state),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.only(
                  top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top + 130,
                  bottom: 62 + MediaQuery.of(context).padding.bottom,
                ),
                itemCount: filteredItems.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  animationController?.forward();
                  return FoodSearchView(
                    food: state.food,
                    animationController: animationController,
                    animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animationController!,
                        curve: Interval((1 / filteredItems.length) * 5, 1.0, curve: Curves.fastOutSlowIn),
                      ),
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
  }

  Widget getAppBarUI(FoodSearchScreenState state) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animationController!,
          child: Transform(
              transform: Matrix4.translationValues(0.0, 30 * (1.0 - animationController!.value), 0.0),
              child: Column(
                children: [
                  Container(
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
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        labelText: 'Search',
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
