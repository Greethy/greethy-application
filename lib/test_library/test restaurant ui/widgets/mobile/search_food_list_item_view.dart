import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/helper/ui_helper.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/nutrition_home_detail/models/spotlight_best_top_food.dart';

class SearchFoodListItemView extends StatelessWidget {
  const SearchFoodListItemView({
    super.key,
    required this.food,
  });

  final SpotlightBestTopFood food;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                )
              ],
            ),
            child: Image.asset(
              food.image,
              height: 80.0,
              width: 80.0,
              fit: BoxFit.fill,
            ),
          ),
          UIHelper.horizontalSpaceSmall(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  food.name,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 15.0),
                ),
                Text(
                  food.desc,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.grey[600], fontSize: 13.5),
                ),
                UIHelper.verticalSpaceSmall(),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 14.0,
                      color: Colors.grey[600],
                    ),
                    Text(food.ratingTimePrice)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
