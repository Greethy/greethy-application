import 'package:flutter/material.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/nutrition_home_detail/models/spotlight_best_top_food.dart';
import 'package:greethy_application/presentation/helper/ui_helper.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/widgets/mobile/search_food_list_item_view.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/widgets/responsive.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const _GroceryHeaderView(),
            UIHelper.verticalSpaceMedium(),
            const GroceryListView(
              title: '156 RESTAURANTS NEARBY',
            ),
          ],
        ),
      ),
    );
  }
}

class _GroceryHeaderView extends StatelessWidget {
  const _GroceryHeaderView();

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);

    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/banner3.jpg',
          height: MediaQuery.of(context).size.height / 2.1,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        if (!isTabletDesktop)
          Positioned(
            top: 40.0,
            left: 0.4,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 28.0,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
      ],
    );
  }
}

class GroceryListView extends StatelessWidget {
  const GroceryListView({super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final restaurants = SpotlightBestTopFood.getTopGroceryRestaurants();

    final headerStyle = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontWeight: FontWeight.w500, fontSize: 13.0);

    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: headerStyle,
              ),
              const Spacer(),
              const Icon(Icons.filter_list),
              UIHelper.horizontalSpaceSmall(),
              Text('SORT/FILTER', style: headerStyle)
            ],
          ),
          UIHelper.verticalSpaceSmall(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: restaurants.length,
            itemBuilder: (context, index) => SearchFoodListItemView(
              food: restaurants[index],
            ),
          )
        ],
      ),
    );
  }
}
