import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/helper/ui_helper.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/nutrition_home_detail/menu/restaurants/restaurant_detail_screen.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/nutrition_home_detail/models/popular_brands.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/widgets/responsive.dart';

class PopularBrandsView extends StatelessWidget {
  final brands = PopularBrands.getPopularBrands();

  PopularBrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          UIHelper.verticalSpaceSmall(),
          _buildPopularHeader(context),
          LimitedBox(
            maxHeight: 200.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              // child: Scrollbar(
              //   thumbVisibility: true,
                child: ListView.builder(
                  primary: true,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: brands.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: isTabletDesktop
                        ? () {}
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FoodDetailScreen(),
                              ),
                            );
                          },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                brands[index].image,
                                height: 80.0,
                                width: 80.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          UIHelper.verticalSpaceSmall(),
                          Text(
                            brands[index].name,
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500),
                          ),
                          UIHelper.verticalSpace(2.0),
                          Text(
                            brands[index].minutes,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.grey, fontSize: 13.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              // ),
            ),
          )
        ],
      ),
    );
  }

  Column _buildPopularHeader(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Popular Brands',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 20.0),
          ),
          UIHelper.verticalSpaceExtraSmall(),
          Text(
            'Most ordered from around your locality',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.grey),
          ),
        ],
      );
}
