import 'package:flutter/material.dart';

class TrophyChallenger extends StatelessWidget {
  const TrophyChallenger() : super();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          TrophyCard(
            image: "assets/images/image_1.png",
            title: "Samantha",
            country: "Russia",
            price: 440,
            press: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DetailsScreen(),
              //   ),
              // );
            },
          ),
          TrophyCard(
            image: "assets/images/image_2.png",
            title: "Angelica",
            country: "Russia",
            price: 440,
            press: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => DetailsScreen()),
              // );
            },
          ),
          TrophyCard(
            image: "assets/images/image_3.png",
            title: "Samantha",
            country: "Russia",
            price: 440,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class TrophyCard extends StatelessWidget {
  const TrophyCard({
    required this.image,
    required this.title,
    required this.country,
    required this.price,
    required this.press,
  }) : super();

  final String image, title, country;
  final int price;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: 20.0,
        top: 20.0 / 2,
        bottom: 20 * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(20 / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xFF0C9869).withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "$title\n".toUpperCase(), style: Theme.of(context).textTheme.labelLarge),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: Color(0xFF0C9869).withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Color(0xFF0C9869)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
