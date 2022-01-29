import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:targyalo_foglalo/dao/MeetingroomData.dart';
import 'package:targyalo_foglalo/screens/checkout.dart';
import 'package:targyalo_foglalo/screens/google_map/map.dart';
import 'package:targyalo_foglalo/screens/home.dart';
import 'package:targyalo_foglalo/screens/meetingRoomCard.dart';
import 'package:targyalo_foglalo/screens/meetingRoomList.dart';
import 'package:targyalo_foglalo/screens/search.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as pathProvide;
import 'Model/address.dart';
import 'Model/meetingRoom.dart';
import 'components/dropdown.dart';
import 'l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvide.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(MeetingRoomAdapter());
  Hive.registerAdapter(AddressAdapter());
  //Hive.registerAdapter(BookingAdapter());
  var box = await Hive.openBox<MeetingRoom>('MeetingRoomAdapter');
  //box.clear();
  MEETING_ROOMS.forEach((meetingRoom) => box.add(meetingRoom));

  /*var box2 = await Hive.openBox<Address>('AddressAdapter');
  box2.add(const Address(postalCode: "a", city: "b", street: "c"));
  print(box2.values);*/

  final cameras = await availableCameras();
  final camera = cameras.length > 0 ? cameras.first : null;


  runApp(ListenableProvider(create: (context) => MeetingroomData(), child: MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const Home(),
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 57, 57, 57)),
      initialRoute: '/',
      routes: {
        '/search': (context) => const Search(),
        '/meetingRooms': (context) => const MeetingRooms(),

        '/checkout': (context) => const Checkout(),
      },
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

    );
  }
}

class RoomGetter extends ChangeNotifier{
  List box = [];

  setRooms(List<MeetingRoom> meetingRoomList) async {
    box = meetingRoomList;
    notifyListeners();
  }
}

