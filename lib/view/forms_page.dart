import 'package:flutter/material.dart';

class FormsPage extends StatefulWidget {
  @override
  _FormsPageState createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool _autovalidate = false;
  String name, mobile, address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Forms'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Normal Text Field'),
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(gapPadding: 10),
                hintText: 'Name',
                labelText: 'Name',
                prefixText: '\$ ',
                suffixText: 'INR',
                prefixIcon: Icon(Icons.monetization_on),
                suffixIcon: IconButton(
                  icon: Icon(Icons.keyboard_hide),
                  onPressed: () {},
                )),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(border: UnderlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Text Form Field'),
          ),
          Form(
            key: _formKey,
            autovalidate: _autovalidate,
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.black)),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (text) {
                      if (text.isNotEmpty)
                        return null;
                      else
                        return 'Please enter your name';
                    },
                    onSaved: (text) {
                      name = text;
                    },
                    decoration: InputDecoration.collapsed(hintText: 'Name'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.black)),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (text) {
                      if (text.isNotEmpty && text.length == 10)
                        return null;
                      else
                        return 'Please enter valid mobile number';
                    },
                    onSaved: (text) {
                      mobile = text;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration.collapsed(hintText: 'Mobile'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.black)),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (text) {
                      if (text.isNotEmpty)
                        return null;
                      else
                        return 'Please enter your address';
                    },
                    onSaved: (text) {
                      address = text;
                    },
                    decoration: InputDecoration.collapsed(hintText: 'Address'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: onSubmitted,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            child: Container(
              height: 45,
              alignment: Alignment.center,
              child: Text(
                'SAVE',
                style: TextStyle(color: Colors.white),
              ),
            ),
            color: Colors.blue,
          )
        ],
      ),
    );
  }

  onSubmitted() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      //NOT VALIDATED
      setState(() {
        _autovalidate = true; // Start validating on every change.
      });
      print('Our incomplete data');
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Fill all the fields'),
      ));
    } else {
      //VALIDATED
      form.save();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Saved successfully'),
        duration: Duration(seconds: 10),
        action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              _scaffoldKey.currentState.hideCurrentSnackBar();
            }),
      ));
      print('Our input data($name)($mobile)($address)');
    }
  }
}
