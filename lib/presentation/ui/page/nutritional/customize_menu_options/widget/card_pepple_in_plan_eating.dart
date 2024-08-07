import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  UserCard({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(name),
      ),
    );
  }
}
