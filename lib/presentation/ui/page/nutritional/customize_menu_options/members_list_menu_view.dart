import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/helper/ui_helper.dart';
import 'package:greethy_application/presentation/widgets/custom_divider_view.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/nutrition_home_detail/models/available_coupon.dart';

class PaymentOffersCouponView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final coupons = AvailableCoupon.getAvailableCoupons();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 15.0),
          height: 40.0,
          color: Colors.grey[200],
          child: Text('Available Coupons',
              style: Theme.of(context).textTheme.titleSmall),
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: coupons.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      border: Border.all(color: Colors.grey[400]!),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/food1.jpg',
                          height: 10.0,
                          width: 10.0,
                          fit: BoxFit.cover,
                        ),
                        UIHelper.horizontalSpaceMedium(),
                        Text(coupons[index].coupon,
                            style: Theme.of(context).textTheme.titleSmall)
                      ],
                    ),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Text(
                    coupons[index].discount,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  UIHelper.verticalSpaceMedium(),
                  const CustomDividerView(
                    dividerHeight: 1.0,
                    color: Colors.grey,
                  ),
                  UIHelper.verticalSpaceMedium(),
                  Text(
                    coupons[index].desc,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 13.0),
                  ),
                  UIHelper.verticalSpaceMedium(),
                  InkWell(
                    child: Text(
                      '+ MORE',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.blue),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}