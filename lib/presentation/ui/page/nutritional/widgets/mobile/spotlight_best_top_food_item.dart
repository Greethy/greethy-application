import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/helper/ui_helper.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/nutrition_home_detail/models/spotlight_best_top_food.dart';

class SpotlightBestTopFoodItem extends StatelessWidget {
  const SpotlightBestTopFoodItem({
    super.key,
    required this.restaurant,
  });

  final SpotlightBestTopFood restaurant;

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = false;

    return InkWell(
      onTap: isTabletDesktop
          ? () {}
          : () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const FoodDetailScreen(),
              //   ),
              // );
            },
      child: Container(
        margin: const EdgeInsets.all(15.0),
        child: Row(
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
                restaurant.image,
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            UIHelper.horizontalSpaceSmall(),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    restaurant.name,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 18.0),
                  ),
                  Text(
                    restaurant.desc,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.grey[800], fontSize: 13.5),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Text(
                    restaurant.coupon,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.red[900], fontSize: 13.0),
                  ),
                  const Divider(),
                  FittedBox(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          size: 14.0,
                          color: Colors.grey[600],
                        ),
                        Text(
                          restaurant.ratingTimePrice,
                          style: const TextStyle(fontSize: 12.0),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
