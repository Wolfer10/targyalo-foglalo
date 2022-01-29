import 'package:flutter/material.dart';
import 'package:targyalo_foglalo/Model/meetingRoom.dart';
import 'package:targyalo_foglalo/components/meetingRoomDetails.dart';

import 'meetingCentreDialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MeetingRoomCard extends StatefulWidget {
  final MeetingRoom meetingRoom;

  const MeetingRoomCard({Key? key, required this.meetingRoom})
      : super(key: key);

  @override
  _MeetingRoomCardState createState() => _MeetingRoomCardState();
}

class _MeetingRoomCardState extends State<MeetingRoomCard>  with SingleTickerProviderStateMixin  {

  Future _showMeetingCentreDetials(
      BuildContext context, MeetingRoom meetingRoom) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) =>
          MeetingCentreDialog(meetingRoom: meetingRoom),
    );
  }

  late AnimationController _animationController;
  late Animation _colorTween;
  late Animation _colorTweenSwitched;
  late Animation _colorTweenBlacked;

  @override
  void initState() {
    _animationController =
        AnimationController( duration: const Duration(milliseconds: 500), vsync: this);
    _colorTween = ColorTween(begin: const Color.fromARGB(255, 244, 243, 240), end: const Color.fromARGB(255, 229, 37, 0))
        .animate(_animationController);
    _colorTweenSwitched = ColorTween(begin: const Color.fromARGB(255, 229, 37, 0), end: const Color.fromARGB(255, 244, 243, 240))
        .animate(_animationController);
    _colorTweenBlacked = ColorTween(begin: Colors.black, end: const Color.fromARGB(255, 244, 243, 240))
        .animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              child: AnimatedBuilder(animation: _colorTween, builder: (context, child) =>
                  InkWell(
                    onTap: (){
                      if (_animationController.status == AnimationStatus.completed) {
                        _animationController.reverse();
                      } else {
                        _animationController.forward();
                      }
                    },
                    child: Card(
                    color: _colorTween.value, //const Color.fromARGB(255, 244, 243, 240),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MeetingRoomDetails(meetingRoom: widget.meetingRoom, color: _colorTweenBlacked.value),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  TextButton.icon(
                                    onPressed: () => {
                                      _showMeetingCentreDetials(
                                          context, widget.meetingRoom)
                                    },
                                    label:  Text(
                                      AppLocalizations.of(context)!.aboutTheCentre,
                                      style: TextStyle(color: _colorTweenBlacked.value),
                                    ),
                                    icon:  Icon(
                                      Icons.camera_alt_outlined,
                                      color: _colorTweenSwitched.value,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text("Ft ${widget.meetingRoom.price}", style:  TextStyle(color: _colorTweenBlacked.value)),
                                      ElevatedButton.icon(
                                          onPressed: () => {
                                                Navigator.pushNamed(
                                                    context, '/checkout',
                                                    arguments: widget.meetingRoom)
                                              },
                                          label:  Text(AppLocalizations.of(context)!.select,  style: TextStyle(color: _colorTween.value)),
                                          icon:  Icon(Icons.check, color: _colorTween.value ,),
                                          style: TextButton.styleFrom(
                                            backgroundColor: _colorTweenSwitched.value,
                                          ))
                                    ],
                                  )
                                ])
                          ]),
                    ),
                ),
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
