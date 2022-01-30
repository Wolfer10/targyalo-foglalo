import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:targyalo_foglalo/components/dropdown.dart';
import 'package:intl/intl.dart';
import 'package:targyalo_foglalo/dao/MeetingroomData.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// This class holds data related to the form.
class MyCustomFormState extends State<SearchForm> {
  String selectedSpaceType = "";
  String selectedLikedCat = "";
  String selectedDate ="";
  String timeFrom = "";
  String timeUntil = "";

  late TextEditingController dateController = TextEditingController();
  late TextEditingController locationController = TextEditingController();



  List<Map> times = [
    {
      "display": "-",
      "value": "-",
    },
    {"display": "8:00", "value": "8:00"},
    {"display": "8:30", "value": "8:30"},
    {"display": "9:00", "value": "9:00"},
    {"display": "9:30", "value": "9:30"},
    {"display": "10:00", "value": "10:00"},
    {"display": "10:30", "value": "10:30"},
    {"display": "11:00", "value": "11:00"},
    {"display": "11:30", "value": "11:30"},
    {"display": "12:00", "value": "12:00"},
    {"display": "12:30", "value": "12:30"},
    {"display": "13:00", "value": "13:00"},
    {"display": "13:30", "value": "13:30"},
    {"display": "14:00", "value": "14:00"},
    {"display": "14:30", "value": "14:30"},
    {"display": "15:00", "value": "15:00"},
    {"display": "15:30", "value": "15:30"},
    {"display": "16:00", "value": "16:00"},
    {"display": "16:30", "value": "16:30"},
    {"display": "17:00", "value": "17:00"},
    {"display": "17:30", "value": "17:30"},
  ];

  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    // Clean up the controller when the widget is removed from the widget tree.
    dateController.dispose();
    locationController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Map> spaceTypes = [
      {
        "display": "-",
        "value": "-",
      },
      {
        "display": AppLocalizations.of(context)!.meetingRoom,
        "value": AppLocalizations.of(context)!.meetingRoom,
      },
      {
        "display": AppLocalizations.of(context)!.dayCoWorking,
        "value": AppLocalizations.of(context)!.dayCoWorking,
      },
      {
        "display": AppLocalizations.of(context)!.dayOffice,
        "value": AppLocalizations.of(context)!.dayOffice,
      },
    ];


    return Form(
        key: _dropdownFormKey,
        child: Expanded(

          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropDownList(
                    items: spaceTypes,
                    titleText: AppLocalizations.of(context)!.typeReuired,
                    setCurrentState: (String value) => selectedSpaceType = value),
                InkWell(
                  onTap: () {
                    _selectDate(context); // Call Function that has showDatePicker()
                  },
                  child: IgnorePointer(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: AppLocalizations.of(context)!.date),
                      maxLength: 10,
                      controller: TextEditingController()
                        ..text = selectedDate,
                    ),
                  ),
                ),
                DropDownList(
                    items: times,
                    titleText: AppLocalizations.of(context)!.from,
                    setCurrentState: (String value) => timeFrom = value),
                DropDownList(
                    items: times,
                    titleText: AppLocalizations.of(context)!.until,
                    setCurrentState: (String value) => timeUntil = value),

                TextFormField(
                    decoration: InputDecoration(labelText: AppLocalizations.of(context)!.numberOfPpl),
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    controller: TextEditingController(),
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                ), TextFormField(
                    decoration: InputDecoration(labelText: AppLocalizations.of(context)!.location),
                    controller: locationController,
                    maxLength: 20,
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.enterTheLocation;
                      }
                      return null;
                    }),
                ElevatedButton(
                    onPressed: () {
                      if (_dropdownFormKey.currentState!.validate()) {
                        // print(selectedSpaceType);
                        // print(selectedLikedCat);
                        Navigator.pushNamed(context, '/meetingRooms', arguments: locationController.text);
                        Provider.of<MeetingroomData>(context, listen: false).getMeetingRooms();
                      }
                    },
                    child:  Text(AppLocalizations.of(context)!.submit))
              ],
            ),
          ),
        ));
  }

  Future _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: convertStringToDate(context),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 360)));
    if (picked != null) {
      setState(() => selectedDate = DateFormat('yyyy/MM/dd').format(picked));
    }
  }

  DateTime convertStringToDate(BuildContext context) {
    return selectedDate == AppLocalizations.of(context)!.today || selectedDate == ""
        ? DateTime.now()
        : DateFormat('yyyy/MM/dd').parse(selectedDate);
  }
}
