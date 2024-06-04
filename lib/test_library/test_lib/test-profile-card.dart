import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/theme/theme.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6E7889),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: GreethyColor.kawa_green,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF4069E2),
                offset: Offset(2, 2),
                blurRadius: 5,
              ),
            ],
          ),
          margin: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Color(0xFFE6EBEE),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Text(
                  'John Doe',
                  style: TextStyle(
                    color: Color(0xFF393B45),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 150,
                height: 150,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: Color(0xFFE6EBEE),
                  borderRadius: BorderRadius.circular(75),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF4069E2),
                      offset: Offset(1, 1),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://drive.google.com/uc?id=1EVA3KUBLxCXF2EGmTf4LUB8F4yAvBrjl',
                    width: 230,
                    height: 230,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 280,
                child: Text(
                  'Hello, my name is John! Bacon ipsum dolor amet short ribs prosciutto strip steak, pig ham tongue buffalo beef ribs hamburger pork venison.',
                  style: TextStyle(
                    color: Color(0xFFE6EBEE),
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        '108',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Posts',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '457',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Followers',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '229',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Following',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xFFE6EBEE),
                      backgroundColor: Color(0xFF4069E2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      minimumSize: Size(130, 0),
                    ),
                    child: Text('Follow'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xFF393B45),
                      backgroundColor: Color(0xFFE6EBEE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      minimumSize: Size(130, 0),
                    ),
                    child: Text('Message'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileCard(),
  ));
}
