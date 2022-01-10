import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.242001, 69.666931),
    zoom: 11,
  );

  Set<Marker> _markers = {
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(23.242001, 69.666931),
        icon: BitmapDescriptor.defaultMarker,
        onTap: () {}),
    Marker(
        markerId: MarkerId("2"),
        position: LatLng(23.219090, 69.632812),
        icon: BitmapDescriptor.defaultMarker,
        onTap: () {}),
    Marker(
        markerId: MarkerId("3"),
        position: LatLng(23.265670, 69.676900),
        icon: BitmapDescriptor.defaultMarker,
        onTap: () {}),
  };

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
