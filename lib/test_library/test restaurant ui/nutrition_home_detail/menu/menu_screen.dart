import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/helper/ui_helper.dart';
import 'package:greethy_application/presentation/theme/app_colors.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/nutrition_home_detail/models/spotlight_best_top_food.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/widgets/custom_divider_view.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/widgets/responsive.dart';

import 'all_restaurants/all_restaurants_screen.dart';
import 'best_in_safety_view.dart';
import 'food_groceries_availability_view.dart';
import 'genie/genie_view.dart';
import 'in_the_spotlight_view.dart';
import 'indian_food/indian_food_view.dart';
import 'offers/offer_banner_view.dart';
import 'offers/offer_screen.dart';
import 'popular_brand_view.dart';
import 'popular_categories_view.dart';
import 'restaurants/restaurant_vertical_list_view.dart';
import 'tips_and_tricks.dart';
import 'top_offer_view.dart';
import 'top_picks_for_you_view.dart';

class NutritionHomeManagementScreen extends StatelessWidget {
  const NutritionHomeManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const FoodGroceriesAvailabilityView(),
                    TopPicksForYouView(),
                    /// todo: Quảng cáo
                    OfferBannerView(),
                    const CustomDividerView(),
                    /// todo: món cay, hải sản, ...
                    VietnamessFoodView(),
                    const CustomDividerView(),
                    // InTheSpotlightView(),
                    // const CustomDividerView(),
                    // PopularBrandsView(),
                    // const CustomDividerView(),
                    /// Tip and Tricks về dinh dưỡng;
                    const TipsAndTricksBannerView(),
                    MenuToday(),
                    const CustomDividerView(),
                    MenuTomorrow(),
                    const CustomDividerView(),
                    const SupportView(),
                    const CustomDividerView(),
                    ContributorsView(),
                    const CustomDividerView(),
                    // RestaurantVerticalListView(
                    //   title: 'Popular Restaurants',
                    //   restaurants: SpotlightBestTopFood.getPopularAllRestaurants(),
                    // ),
                    // const CustomDividerView(),
                    // RestaurantVerticalListView(
                    //   title: 'All Restaurants Nearby',
                    //   restaurants: SpotlightBestTopFood.getPopularAllRestaurants(),
                    //   isAllRestaurantNearby: true,
                    // ),
                    const SeeAllRestaurantBtn(),
                    const LiveForFoodView(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildAppBar(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        height: 60.0,
        child: Row(
          children: <Widget>[
            Text(
              'Khám phá',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 21.0),
            ),
            UIHelper.horizontalSpaceExtraSmall(),
            const Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Icon(Icons.keyboard_arrow_down),
            ),
            const Spacer(),
            const Icon(Icons.menu_book),
            UIHelper.horizontalSpaceExtraSmall(),
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Menu Today',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 18.0),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MenuTodayScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      );
}

class SeeAllRestaurantBtn extends StatelessWidget {
  const SeeAllRestaurantBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      height: 50.0,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: darkGreen),
        onPressed: isTabletDesktop
            ? () {}
            : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllRestaurantsScreen(),
                  ),
                );
              },
        child: Text(
          'See all restaurants',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontSize: 19.0),
        ),
      ),
    );
  }
}

class LiveForFoodView extends StatelessWidget {
  const LiveForFoodView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.all(15.0),
      height: 400.0,
      color: Colors.grey[200],
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'LIVE\nFOR\nFOOD',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.grey[400],
                      fontSize: 80.0,
                      letterSpacing: 0.2,
                      height: 0.8,
                    ),
              ),
              UIHelper.verticalSpaceLarge(),
              Text(
                'MADE BY FOOD LOVERS',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.grey),
              ),
              Text(
                'SWIGGY HQ, BANGALORE',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.grey),
              ),
              UIHelper.verticalSpaceExtraLarge(),
              Row(
                children: <Widget>[
                  Container(
                    height: 1.0,
                    width: MediaQuery.of(context).size.width / 4,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),
          Positioned(
            left: 140.0,
            top: 90.0,
            child: Image.asset(
              'assets/images/burger.png',
              height: 80.0,
              width: 80.0,
            ),
          )
        ],
      ),
    );
  }
}
