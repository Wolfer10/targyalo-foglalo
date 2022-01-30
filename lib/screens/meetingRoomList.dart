import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:targyalo_foglalo/Model/meetingRoom.dart';
import 'package:targyalo_foglalo/dao/MeetingroomData.dart';
import 'package:targyalo_foglalo/screens/meetingRoomCard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../main.dart';

class MeetingRooms extends StatefulWidget {
  const MeetingRooms({Key? key}) : super(key: key);

  @override
  _MeetingRoomsState createState() => _MeetingRoomsState();
}

class _MeetingRoomsState extends State<MeetingRooms> {
  @override
  Widget build(BuildContext context) {

    return Consumer<MeetingroomData>(
        builder: (context, meetingRoomData, child) {
          meetingRoomData.filterMeetingRooms(ModalRoute
              .of(context)!
              .settings
              .arguments as String);
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.meetingRooms),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 229, 37, 0),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: meetingRoomData.getMeetingRoomsLength(),
                  itemBuilder: (BuildContext context, int index) {
                    var actMeetingRoom = meetingRoomData.meetingRooms[index];
                    return Container(
                      height: 260,
                      child: Stack(
                        children: [
                          Container(
                            child: MeetingRoomCard(meetingRoom: actMeetingRoom),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
