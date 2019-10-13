import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GoogleSignInAccount account;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      key: _scaffoldKey,
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
            if (account != null)
              CircleAvatar(
                backgroundImage: NetworkImage(account.photoUrl),
                radius: 70,
              )
            else
              Icon(
                CupertinoIcons.profile_circled,
                size: 160.0,
                color: Color(0xFF646464),
              ),
            Padding(padding: EdgeInsets.only(top: 18.0)),
            CupertinoButton.filled(
              child: Text(account != null ? 'Sign out' : 'Sign in'),
              onPressed: account != null ? _handleSignOut : _handleSignIn,
            ),
          ],
        ),
      ),
    );
  }

  Future _handleSignIn() async {
    try {
      await _googleSignIn.signIn().then((data) {
        if (data != null) {
          setState(() {
            account = data;
          });
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text('Authentication Successfull'),
          ));
          print(data.email + ' : ' + data.photoUrl);
        } else {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text('Authentication Failed'),
          ));
        }
      });
    } catch (error) {
      print(error);
    }
  }

  Future _handleSignOut() async {
    try {
      await _googleSignIn.signOut().then((_) {
        setState(() {
          account = null;
        });
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Signed out successfully'),
        ));
      });
    } catch (error) {
      print(error);
    }
  }
}
