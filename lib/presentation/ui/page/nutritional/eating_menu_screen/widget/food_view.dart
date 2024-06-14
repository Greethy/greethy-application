import 'package:flutter/material.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/food_menu_screen/food_detail_screen.dart';

class FoodView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final FoodIndex foodInfo;

  const FoodView({
    Key? key,
    this.animationController,
    this.animation,
    required this.foodInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: AppTheme.grey.withOpacity(0.2),
                      offset: Offset(1.1, 1.1),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        onTap: () {
                          // print("ra screen món ăn");
                          Navigator.push(context, FoodDetailScreen.getRoute(foodId: foodInfo.foodId ?? "1"));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 2 / 5,
                            height: MediaQuery.of(context).size.width / 3,
                            child: Image.network(
                              foodInfo.foodPic ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5, right: 10, top: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                foodInfo.name ?? "Hủ Tiếu",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      InkWell(
                                        highlightColor: Colors.transparent,
                                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                        onTap: () {
                                          // print("ra screen món ăn");
                                          Navigator.push(context, FoodDetailScreen.getRoute(foodId: foodInfo.foodId ?? "1"));
                                        },
                                        child: Icon(
                                          Icons.info_rounded,
                                          size: 32.0,
                                          color: GreethyColor.kawa_green,
                                        ),
                                      ),
                                      Wrap(
                                        children: [Text("Công thức")],
                                      ),
                                      Wrap(
                                        children: [Text("món ăn")],
                                      ),
                                      Wrap(),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      InkWell(
                                        highlightColor: Colors.transparent,
                                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                        onTap: () {
                                          print("đổi món ăn");
                                        },
                                        child: Icon(
                                          Icons.change_circle,
                                          size: 32.0,
                                          color: GreethyColor.kawa_green,
                                        ),
                                      ),
                                      Wrap(
                                        children: [Text("Đổi")],
                                      ),
                                      Wrap(
                                        children: [Text("Món ăn")],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
