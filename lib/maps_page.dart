import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController controller;
  List<Marker> markersList;
  var icon;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.9797, 77.5912),
    tilt: 59.440717697143555,
    zoom: 16.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      //bearing: 192.8334901395799,
      target: LatLng(12.9849, 77.5896),
      tilt: 59.440717697143555,
      zoom: 16.4746);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(10, 10)), 'assets/car.png')
        .then((item) {
      setState(() {
        icon = item;
        markersList = [
          Marker(
              markerId: MarkerId('1'),
              position: LatLng(12.9849, 77.5896),
              icon: icon),
          Marker(
              markerId: MarkerId('2'),
              position: LatLng(12.9797, 77.5912),
              icon: icon)
        ];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: icon != null
          ? GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              markers: markersList.toSet(),
              onMapCreated: (GoogleMapController controller) {
                this.controller = controller;
                _controller.complete(controller);
              },
            )
          : SizedBox(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FloatingActionButton(
            heroTag: '9',
            child: Icon(Icons.navigation),
            onPressed: _goToBack,
          ),
          FloatingActionButton(
            child: Icon(Icons.navigation),
            onPressed: _goToTheLake,
          ),
        ],
      ),
    );
  }

  Future<void> _goToBack() async {
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  }

  Future<void> _goToTheLake() async {
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
