import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:new_app/model/brand.dart';

class BrandsPage extends StatefulWidget {
  @override
  _BrandsPageState createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  bool isLoading = true;
  List<Brand> brands = List();

  @override
  void initState() {
    super.initState();
    getBrands();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brands'),
      ),
      body: Stack(
        children: <Widget>[
          GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: brands.length,
            itemBuilder: (BuildContext context, int index) {
              Brand brand = brands[index];
              return Container(
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
              );
            },
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Future getBrands() async {
    await FirebaseDatabase.instance
        .reference()
        .child('brands')
        .once()
        .then((data) {
      print(data.value);
      List<dynamic> list = data.value;
      setState(() {
        brands = list.map<Brand>((item) => Brand.fromJson(item)).toList();
        isLoading = false;
      });
    });
  }
}
