import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_app/model/user.dart';
import 'package:new_app/view/hero_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
  ],
);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User user;

  @override
  void initState() {
    super.initState();
    getLoginStatus();
  }

  getLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey('user')) {
      setState(() {
        user = User.fromJson(json.decode(sharedPreferences.getString('user')));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          child: Text('Cancel'),
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (user != null)
              GestureDetector(
                child: Hero(
                  tag: 'profile',
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user.photoUrl),
                    radius: 70,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HeroPage(
                                user: user,
                              )));
                },
              )
            else
              Icon(
                CupertinoIcons.profile_circled,
                size: 160.0,
                color: Color(0xFF646464),
              ),
            Padding(padding: EdgeInsets.only(top: 18.0)),
            CupertinoButton.filled(
              child: Text(user != null ? 'Sign out' : 'Sign in'),
              onPressed: user != null ? _handleSignOut : _handleSignIn,
            ),
          ],
        ),
      ),
    );
  }

  Future _handleSignIn() async {
    try {
      await _googleSignIn.signIn().then((account) async {
        if (account != null) {
          Fluttertoast.showToast(
              msg: 'Authentication Successfull',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0);

          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();

          setState(() {
            user = User(
                id: account.id,
                displayName: account.displayName,
                email: account.email,
                photoUrl: account.photoUrl,
                token: '');
          });

          //Json to String
          print(json.encode(user.toJson()));
          sharedPreferences.setString('user', json.encode(user.toJson()));
        } else {
          Fluttertoast.showToast(
              msg: 'Authentication Failed',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      });
    } catch (error) {
      print(error);
    }
  }

  Future _handleSignOut() async {
    try {
      await _googleSignIn.signOut().then((_) async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.remove('user');
        setState(() {
          user = null;
        });
        Fluttertoast.showToast(
            msg: 'Signed Out Successfully',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    } catch (error) {
      print(error);
    }
  }
}
