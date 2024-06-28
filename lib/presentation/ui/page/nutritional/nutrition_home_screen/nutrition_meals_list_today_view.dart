import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/nutrition/nutrition_home_screen_state.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/nutrition_home_screen/widget/meals_card.dart';

class MealsListTodayView extends StatefulWidget {
  const MealsListTodayView({
    Key? key,
    this.mainScreenAnimationController,
    this.mainScreenAnimation,
    required this.state,
  }) : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  final NutritionHomeScreenState state;

  @override
  _MealsListTodayViewState createState() => _MealsListTodayViewState();
}

class _MealsListTodayViewState extends State<MealsListTodayView> with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
              0.0,
              30 * (1.0 - widget.mainScreenAnimation!.value),
              0.0,
            ),
            child: Container(
              height: 216,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
                itemCount: widget.state.meals.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count = widget.state.meals.length > 10 ? 10 : widget.state.meals.length;
                  final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animationController!,
                      curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn),
                    ),
                  );
                  animationController?.forward();

                  return MealsView(
                    state: widget.state,
                    mealsModel: widget.state.meals[index],
                    animation: animation,
                    animationController: animationController!,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

