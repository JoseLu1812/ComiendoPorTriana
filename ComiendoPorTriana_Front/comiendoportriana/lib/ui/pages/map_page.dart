import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key, required this.lat, required this.lng});
  final double? lat;
  final double? lng;

  @override
  _MapPage createState() => _MapPage();
}

// ignore: must_be_immutable
class _MapPage extends State<MapPage> {
  static String id = 'map_page';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo-title.png',
          height: 170,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: _MapBody(),
    );
  }

  _MapBody() {

  final CameraPosition _cameraPosition =
      CameraPosition(
        target: LatLng(widget.lat!, widget.lng!), zoom: 11.00
      );

    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _cameraPosition,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      minMaxZoomPreference: MinMaxZoomPreference.unbounded,
      rotateGesturesEnabled: true,
      scrollGesturesEnabled: true,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: true,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }
}
