import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/helper/ui_helper.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/nutrition_home_detail/menu/restaurants/restaurant_detail_screen.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/nutrition_home_detail/models/spotlight_best_top_food.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/widgets/mobile/food_list_item_view.dart';

class RestaurantOfferView extends StatelessWidget {
  final foods = [
    ...SpotlightBestTopFood.getPopularAllRestaurants(),
    ...SpotlightBestTopFood.getPopularAllRestaurants(),
    ...SpotlightBestTopFood.getPopularAllRestaurants()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UIHelper.verticalSpaceSmall(),
          Text(
            'All Offers (${foods.length})',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 19.0),
          ),
          UIHelper.verticalSpaceMedium(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: foods.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FoodDetailScreen(),
                      ),
                    );
                  },
                  child: FoodListItemView(
                    restaurant: foods[index],
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