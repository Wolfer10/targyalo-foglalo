import 'package:flutter/material.dart';
import 'package:targyalo_foglalo/Model/meetingRoom.dart';

import 'google_map/map.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MeetingCentreDialog extends StatelessWidget {
  final MeetingRoom meetingRoom;

  const MeetingCentreDialog({Key? key, required this.meetingRoom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Container(
        child: Text(meetingRoom.name),
        alignment: Alignment.center,
      ),
      contentPadding: const EdgeInsets.all(10),
      children: [
        Text(meetingRoom.address.city),
        Text(meetingRoom.address.street),
        Text( AppLocalizations.of(context)!.receptionOpen),
        Text(AppLocalizations.of(context)!.mondayToFriday),
        const Divider(thickness: 1.0, height: 1.1, color: Colors.grey,),
        Image(image: AssetImage(meetingRoom.imageRoute),),
        ShowMapWithMarker(meetingRoom: meetingRoom,)
      ],

    );
  }
}
