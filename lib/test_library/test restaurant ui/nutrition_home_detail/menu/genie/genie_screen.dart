import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/theme/app_colors.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/nutrition_home_detail/models/genie.dart';
import 'package:greethy_application/presentation/helper/ui_helper.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/widgets/custom_divider_view.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = Support.getSupportServices();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          color: Colors.indigo,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      UIHelper.verticalSpaceMedium(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Support',
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                              ),
                              UIHelper.horizontalSpaceSmall(),
                              Image.asset(
                                'assets/images/delivery-boy.png',
                                height: 50.0,
                                width: 50.0,
                              )
                            ],
                          ),
                          UIHelper.verticalSpaceExtraSmall(),
                          Text(
                            'Greethy',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: Colors.grey[200],
                                  fontSize: 17.0,
                                ),
                          )
                        ],
                      ),
                      UIHelper.verticalSpaceMedium(),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const _HeaderView(
                              title: 'Tất cả những gì bạn cần,',
                              buttonTitle: 'chúng tôi đều cung cấp',
                            ),
                            const CustomDividerView(dividerHeight: 3.0),
                            UIHelper.verticalSpaceMedium(),
                            Text(
                              'Some things we can pick or drop for you',
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14.0),
                            ),
                            UIHelper.verticalSpaceMedium(),
                            LimitedBox(
                              maxHeight: 100.0,
                              child: ListView.builder(
                                itemCount: services.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => SizedBox(
                                  width: 80.0,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ClipOval(
                                        child: Container(
                                          padding: const EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            boxShadow: const <BoxShadow>[
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 3.0,
                                                spreadRadius: 2.0,
                                              )
                                            ],
                                          ),
                                          child: Image.asset(
                                            services[index].image,
                                            height: 30.0,
                                            width: 30.0,
                                            // fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        services[index].title,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 13.5),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      UIHelper.verticalSpaceMedium(),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const _HeaderView(
                          title: 'Buy Anything from any store',
                          buttonTitle: 'FIND A STORE',
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderView extends StatelessWidget {
  final String title;
  final String buttonTitle;

  const _HeaderView({
    required this.title,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        UIHelper.verticalSpaceMedium(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          height: 50.0,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: darkGreen),
            child: Text(
              buttonTitle,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontSize: 14.0),
            ),
            onPressed: () {},
          ),
        ),
        UIHelper.verticalSpaceMedium(),
      ],
    );
  }
}
