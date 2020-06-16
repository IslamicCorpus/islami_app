import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MasjidMapView extends StatefulWidget {
  @override
  _MasjidMapViewState createState() => _MasjidMapViewState();
}

class _MasjidMapViewState extends State<MasjidMapView> {
  GoogleMapController _controller;
  List<Marker> allMarker = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(-1.833957, 109.978674),
            zoom: 14.0,
          ),
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
        ),
      ),
    );
  }
}
