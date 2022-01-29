import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import 'address.dart';
import 'booking.dart';

part 'meetingRoom.g.dart';

@HiveType(typeId: 1, adapterName: "MeetingRoomAdapter")
class MeetingRoom {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final Address address;
  @HiveField(2)
  final int price;
  @HiveField(3)
  final List<Booking> bookings;
  @HiveField(4)
  final String imageRoute;

  const MeetingRoom(this.bookings,
      {required this.name, required this.address, required this.price, required this.imageRoute});
}

const MEETING_ROOMS = [
  MeetingRoom([],
      name: "BUDAPEST, SZERVITA SQUARE 8",
      address: Address(
          street: "Szervita square 8", city: "Budapest", postalCode: "1052"),
      price: 18000,
      imageRoute: "assets/szervita.jpg"
  ),

  MeetingRoom([],
      name: "BUDAPEST, PRESIDENT CENTRE",
      address: Address(
          street: "Regus House, Kálmán Imre utca 1", city: "Budapest", postalCode: "1054"),
      price: 10200, imageRoute: "assets/szervita.jpg",),

  MeetingRoom([],
      name: "BUDAPEST, FIRST SITE",
      address: Address(
          street: "Kossuth Lajos utca 7-9", city: "Budapest", postalCode: "1054"),
      price: 10200, imageRoute: "assets/szervita.jpg"),

  MeetingRoom([],
      name: "BUDAPEST, WEST END",
      address: Address(
          street: "Westend Business Centre, 22-24 Váci út, VII. floor.", city: "Budapest", postalCode: "1132"),
      price: 10200, imageRoute: "assets/szervita.jpg")
];
