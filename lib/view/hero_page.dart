import 'package:flutter/material.dart';
import 'package:new_app/model/user.dart';

class HeroPage extends StatelessWidget {
  HeroPage({Key key, this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.topCenter,
      child: Hero(
        tag: 'profile',
        child: CircleAvatar(
          backgroundImage: NetworkImage(user.photoUrl),
          radius: 70,
        ),
      ),
    ));
  }
}
