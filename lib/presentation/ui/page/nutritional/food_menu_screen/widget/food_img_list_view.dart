import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/food_screen_state.dart';
import 'package:provider/provider.dart';

class FoodImageListView extends StatefulWidget {
  final FoodScreenState state;

  const FoodImageListView({
    super.key,
    required this.state,
  });

  @override
  _FoodImageListView createState() => _FoodImageListView();
}

class _FoodImageListView extends State<FoodImageListView> with TickerProviderStateMixin {
  AnimationController? animationController;

  Animation<double>? topBarAnimation;

  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  final int count = 9;

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
    var state = Provider.of<FoodScreenState>(context, listen: true);
    return Consumer<FoodScreenState>(
      builder: (context, state, _) {
        return FutureBuilder<bool>(
          future: Future.value(state.food != null),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return SizedBox(
                height: 250.0,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: state.food!.foodImageUrl!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    animationController?.forward();
                    return Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        padding: const EdgeInsets.all(10.0),
                        width: 350,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Image.network(
                          state.food!.foodImageUrl![index],
                          fit: BoxFit.cover,
                        ));
                  },
                ),
              );
            }
          },
        );
      },
    );
  }
}
