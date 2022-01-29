import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:targyalo_foglalo/Model/meetingRoom.dart';
import 'package:targyalo_foglalo/components/meetingRoomDetails.dart';
import 'package:permission_handler/permission_handler.dart';

import 'contacts/contact.dart';


class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {

  List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    final MeetingRoom meetingRoom =
    ModalRoute
        .of(context)!
        .settings
        .arguments as MeetingRoom;
    int price = meetingRoom.price;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 229, 37, 0),
      ),
      body: Column(children: <Widget>[
        const Text("Your selected room:"),
        const Text("Meeting room: for x people"),
        Row(
          children: <Widget>[
            const Text("2022/01/23"),
            const Text("8:00 -> 9:30"),
            Text("${meetingRoom.price}"),
          ],
        ),
        const Divider(),
        MeetingRoomDetails(meetingRoom: meetingRoom),
        const Divider(),
        ListView.builder(itemCount: contacts.length, shrinkWrap: true,
            itemBuilder: (context, index) => _buildItem(context, index)),
        ElevatedButton(onPressed: ()  => chooseContact(),
          child: Text("Add Contact"),),
        Column(children: [
          const Text("Coffe & Tea"),
          const Text("400Ft per serving"),
          const Text("per person"),
          //Checkbox(onChanged: (_) => price + 400, value: null,),
          Text("$price")
        ])
      ]),
    );
  }

  void chooseContact() async {
    if (await Permission.contacts
        .request()
        .isGranted) {
      Contact contact = await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ContactChooser()),);
      _addContact(contact);
    } else if (await Permission.contacts.isPermanentlyDenied) {
      openAppSettings();
    } else {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content:
            Text("Access denied"),
          ),
        );
    }
    setState(() {});
  }

  void _addContact(Contact contact)  {
    contacts.add(contact);
  }


  Widget _buildItem(BuildContext context, int index) {
    var actContact = contacts[index];
    return Stack(
      children: [
        SizedBox(
          height: 20,
          child: Text(actContact.displayName ?? ""),
        ),
      ],
    );
  }

}