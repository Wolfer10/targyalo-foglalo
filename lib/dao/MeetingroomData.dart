import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:targyalo_foglalo/Model/meetingRoom.dart';

class MeetingroomData extends ChangeNotifier{
  List<MeetingRoom> _meetingrooms = [];
  UnmodifiableListView<MeetingRoom> get meetingRooms => UnmodifiableListView(_meetingrooms);

  getMeetingRooms() async {
    Box<MeetingRoom> box = await Hive.openBox<MeetingRoom>("MeetingRoomAdapter");
    _meetingrooms = box.values.toList();
    notifyListeners();
  }

  int getMeetingRoomsLength(){
    return _meetingrooms.length;
  }

}