import 'package:flutter/material.dart';
import 'package:location/location.dart';

class GetCurrentLocation extends StatefulWidget {
  @override
  _GetCurrentLocationState createState() => _GetCurrentLocationState();
}

class _GetCurrentLocationState extends State<GetCurrentLocation> {
  PermissionStatus _permissionGranted;
  Location location = new Location();
  bool _serviceEnabled;
  LocationData _locationData;
  bool isloading = false;

  locationPermission() async {
    _permissionGranted = await location.hasPermission();
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    } else if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Location Permission Needed')));
        return;
      }
    } else {
      isloading = true;
      setState(() {});
      _locationData = await location.getLocation();
      isloading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: isloading
            ? new CircularProgressIndicator()
            : _locationData == null
                ? ElevatedButton(
                    onPressed: () => locationPermission(),
                    child: Text(
                      'Get Location',
                    ),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Lattitude - ${_locationData.latitude}',
                      ),
                      Text(
                        'Longitude - ${_locationData.longitude}',
                      ),
                    ],
                  ),
      ),
    );
  }
}
