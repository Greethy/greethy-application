import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/helper/ui_helper.dart';
import 'package:greethy_application/presentation/theme/app_colors.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/nutrition_home_detail/menu/genie/genie_screen.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/widgets/responsive.dart';

import 'all_restaurants/all_restaurants_screen.dart';
import 'genie/genie_grocery_card_view.dart';
import 'meat/meat_screen.dart';

class FoodGroceriesAvailabilityView extends StatelessWidget {
  const FoodGroceriesAvailabilityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                child: Container(
                  width: 10.0,
                  height: 140.0,
                  color: menuGreen,
                ),
              ),
              UIHelper.horizontalSpaceMedium(),
              Flexible(
                child: Column(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headlineMedium,
                        children: [
                          TextSpan(text: 'Hành trình chăm sóc sức khỏe dinh dưỡng cùng '),
                          TextSpan(text: 'Greethy.', style: TextStyle(color: GreethyColor.kawa_green)),
                        ],
                      ),
                    ),
                    UIHelper.verticalSpaceSmall(),
                    Text(
                      'Chăm sóc sức khỏe dinh dưỡng của bản thân là một yếu tố quan trọng để duy trì sức khỏe tốt và cải thiện chất lượng cuộc sống.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16.0,
                            color: Colors.grey[800],
                          ),
                    )
                  ],
                ),
              )
            ],
          ),
          UIHelper.verticalSpaceLarge(),
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllRestaurantsScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 170.0,
                    color: menuGreen,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: FractionallySizedBox(
                            widthFactor: 0.7,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Menu',
                                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                                  ),
                                  UIHelper.verticalSpaceSmall(),
                                  Text(
                                    'Sổ tay ẩm thực dinh dưỡng, đồng hành cùng bạn.',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 45.0,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          color: darkGreen,
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Tra cứu',
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white, fontSize: 18.0),
                              ),
                              UIHelper.horizontalSpaceSmall(),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 18.0,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -10.0,
                right: -10.0,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/food1.jpg',
                    width: 130.0,
                    height: 130.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          UIHelper.verticalSpaceMedium(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SupportGroceryCardView(
                title: 'Món Bắc',
                subtitle: 'Tất cả những gì bạn cần',
                image: 'assets/images/food1.jpg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SupportScreen(),
                    ),
                  );
                },
              ),
              SupportGroceryCardView(
                title: 'Món Trung',
                subtitle: 'Greethy',
                image: 'assets/images/food4.jpg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SupportScreen(),
                    ),
                  );
                },
              ),
              SupportGroceryCardView(
                title: 'Món Nam',
                subtitle: 'Đều có!!!\n ^_^',
                image: 'assets/images/food6.jpg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MeatScreen(),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
