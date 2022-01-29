import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class ContactChooser extends StatefulWidget {
  const ContactChooser({Key? key}) : super(key: key);

  @override
  _ContactChooserState createState() => _ContactChooserState();
}

class _ContactChooserState extends State<ContactChooser> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Iterable<Contact>>(
        future: ContactsService.getContacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: ListView(
                children: snapshot.data?.map((contact) {
                      return ListTile(
                        title: Text(contact.displayName ?? ''),
                        onTap: () {
                          Navigator.pop(context, contact);
                        },
                      );
                    }).toList() ??
                    [],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
