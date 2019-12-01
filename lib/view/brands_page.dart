import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/firestore_ui.dart';
import 'package:flutter/material.dart';
import 'package:new_app/model/brand.dart';

class BrandsPage extends StatefulWidget {
  @override
  _BrandsPageState createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  // bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brands'),
      ),
      body: Stack(
        children: <Widget>[
          FirestoreAnimatedGrid(
            query: Firestore.instance.collection('brands').snapshots(),
            padding: EdgeInsets.all(10),
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.0,
            crossAxisSpacing: 10.0,
            itemBuilder: (BuildContext context, DocumentSnapshot snapshot,
                Animation<double> animation, int index) {
              Brand brand = Brand.fromJson(snapshot.data);
              return FadeTransition(
                opacity: animation,
                child: Container(
                  height: 150,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: FlutterLogo(
                            size: 80,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(brand.title),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
//          isLoading
//              ? Center(
//                  child: CircularProgressIndicator(),
//                )
//              : SizedBox(),
        ],
      ),
    );
  }

//  Future getBrands() async {
//    //How to get a list of data from Firebase Database
//    await FirebaseDatabase.instance
//        .reference()
//        .child('brands')
//        .once()
//        .then((data) {
//      print(data.value);
//      List<dynamic> list = data.value;
//      setState(() {
//        brands = list.map<Brand>((item) => Brand.fromJson(item)).toList();
//        setBrandsInCF();
//        isLoading = false;
//      });
//    });
//  }

//  setBrandsInCF() async {
//    //How to set a list of data from Cloud Firestore
//    brands.forEach((brand) async {
//      await Firestore.instance
//          .collection('brands')
//          .document()
//          .setData(brand.toJson());
//    });
//  }
}
