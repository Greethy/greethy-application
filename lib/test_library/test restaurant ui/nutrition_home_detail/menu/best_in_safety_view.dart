import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/helper/ui_helper.dart';
import 'package:greethy_application/presentation/theme/app_colors.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/nutrition_home_detail/models/spotlight_best_top_food.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/widgets/mobile/spotlight_best_top_food_item.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/widgets/responsive.dart';

class MenuToday extends StatelessWidget {
  final restaurants = SpotlightBestTopFood.getBestRestaurants();

  MenuToday({super.key});

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);
    final customWidth = MediaQuery.of(context).size.width / (isTabletDesktop ? 3.8 : 1.1);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Icon(Icons.security),
                    UIHelper.horizontalSpaceExtraSmall(),
                    Text(
                      'Thực đơn hôm nay',
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 20.0),
                    ),
                    const Spacer(),
                    Row(
                      children: <Widget>[
                        Text(
                          'SEE ALL',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                        ),
                        UIHelper.horizontalSpaceExtraSmall(),
                        ClipOval(
                          child: Container(
                            alignment: Alignment.center,
                            color: menuGreen,
                            height: 25.0,
                            width: 25.0,
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 12.0,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                UIHelper.verticalSpaceExtraSmall(),
                Text(
                  'Restaurants with best safety standards',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          UIHelper.verticalSpaceMedium(),
          LimitedBox(
            maxHeight: 320.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: restaurants.length,
              itemBuilder: (context, index) => SizedBox(
                width: customWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: SpotlightBestTopFoodItem(restaurant: restaurants[index][0]),
                    ),
                    Expanded(
                      child: SpotlightBestTopFoodItem(restaurant: restaurants[index][1]),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
