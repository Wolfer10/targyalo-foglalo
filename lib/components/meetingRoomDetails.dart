import 'package:flutter/material.dart';
import 'package:targyalo_foglalo/Model/meetingRoom.dart';

class MeetingRoomDetails extends StatelessWidget {
  final MeetingRoom meetingRoom;
  final Color? color;

  const MeetingRoomDetails({Key? key, required this.meetingRoom, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Dummy room #1",
          style: TextStyle(fontWeight: FontWeight.bold, color: color ?? Colors.black),
        ),
         Divider(
          color: color ?? Colors.black,
          thickness: 1.2,
        ),
        Text(meetingRoom.name, style: TextStyle(fontSize: 17.0, color: color  ?? Colors.black)),
        const SizedBox(
          height: 10,
        ),
        Text(meetingRoom.address.street, style: TextStyle(color: color  ?? Colors.black)),
        Text(meetingRoom.address.city, style: TextStyle(color: color  ?? Colors.black)),
        Text(meetingRoom.address.postalCode, style: TextStyle(color: color  ?? Colors.black)),
      ],
    );
  }
}
