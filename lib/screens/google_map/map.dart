// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:targyalo_foglalo/Model/meetingRoom.dart';

class ShowMapWithMarker extends StatefulWidget {


  final MeetingRoom meetingRoom;
  const ShowMapWithMarker({Key? key, required this.meetingRoom})
      : super(key: key);

  @override
  _ShowMapWithMarkerState createState() => _ShowMapWithMarkerState();
}

class _ShowMapWithMarkerState extends State<ShowMapWithMarker> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LatLng>(
        future: _getLatLngFromLocationList(widget.meetingRoom.address.street, widget.meetingRoom.address.city),
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (dataSnapshot.error != null) {
            return const Center(
              child: Text('An error occured'),
            );
          } else {
            return SizedBox(
              height: 200,
              width: 200,
              child: Center(
                child: GoogleMap(
                  myLocationButtonEnabled: false,
                  initialCameraPosition:
                      CameraPosition(target: dataSnapshot.data ?? const LatLng(0, 0) , zoom: 15),
                  markers: {
                    Marker(
                        markerId: const MarkerId("officeCentreMarker"),
                        position:  dataSnapshot.data ?? const LatLng(0, 0),
                        infoWindow: InfoWindow(title: widget.meetingRoom.name)
                    )
                  },
                ),
              ),
            );
          }
        });
  }

  Future<List<Location>> _getLocationFromaddress(
      String address, String city) async {
    List<Location> location = await locationFromAddress("$address, $city");
    return location;
  }

  Future<LatLng> _getLatLngFromLocationList(
      String address, String city) async {
    List<Location> locations = await _getLocationFromaddress(address, city);
    //return locations.first;
    return LatLng(locations.first.latitude, locations.first.longitude);
  }
}
