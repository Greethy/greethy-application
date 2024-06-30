import 'package:flutter/material.dart';

class FeaturedTopClubs extends StatelessWidget {
  const FeaturedTopClubs() : super();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeatureTopClubCard(
            image: "assets/images/bottom_img_3.png",
            press: () {},
          ),
          FeatureTopClubCard(
            image: "assets/images/bottom_img_2.png",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class FeatureTopClubCard extends StatelessWidget {
  const FeatureTopClubCard({
    required this.image,
    required this.press,
  }) : super();
  final String image;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
          top: 20 / 2,
          bottom: 20 / 2,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
