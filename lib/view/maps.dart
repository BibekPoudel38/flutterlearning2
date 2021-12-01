import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(28.208180951451386, 83.98569369550964),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  Set<Marker> markers = <Marker>{};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: (latlng) {
          markers.add(
            Marker(
              markerId: MarkerId(DateTime.now().toString()),
              position: latlng,
            ),
          );
          setState(() {});
        },
        markers: markers,
        polylines: {
          Polyline(polylineId: PolylineId("1"), points: [
            LatLng(28.212764915002392, 83.97557368811191),
            LatLng(28.209587006072002, 83.98551030297493),
            LatLng(28.205802387096828, 83.98281801650216),
            LatLng(28.19809612162401, 83.97577809161523),
          ])
        },
        polygons: {
          Polygon(
            strokeColor: Colors.transparent,
            fillColor: Colors.red.withOpacity(0.3),
            polygonId: PolygonId("1"),
            points: [
              LatLng(28.205798356591195, 83.97157454721766),
              LatLng(28.19036693214941, 83.97432112925621),
              LatLng(28.204436849955286, 83.99946952104679),
              LatLng(28.2168032315082, 83.97826934093663)
            ],
          ),
        },
        liteModeEnabled: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
