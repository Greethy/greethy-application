import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/helper/ui_helper.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/nutrition_home_detail/menu/restaurants/restaurant_detail_screen.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/nutrition_home_detail/models/top_picks_food.dart';

class TopPicksForYouView extends StatelessWidget {
  final foods = TopPicksFood.getTopPicksfoods();

  TopPicksForYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Icon(Icons.thumb_up, size: 20.0),
              UIHelper.horizontalSpaceSmall(),
              Text(
                'Món ăn hàng đầu',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 20.0),
              )
            ],
          ),
          UIHelper.verticalSpaceLarge(),
          LimitedBox(
            maxHeight: 188.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: foods.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FoodDetailScreen(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 125.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                            )
                          ],
                        ),
                        child: Image.asset(
                          foods[index].image,
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      UIHelper.verticalSpaceSmall(),
                      Flexible(
                        child: Text(
                          foods[index].name,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      UIHelper.verticalSpaceExtraSmall(),
                      Text(
                        'Nấu trong: ' + foods[index].minutes,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.grey[700],
                              fontSize: 13.0,
                            ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
