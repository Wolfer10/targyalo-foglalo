import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:targyalo_foglalo/components/dropdown.dart';
import 'package:intl/intl.dart';

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
  String selectedDate = "Today";
  String timeFrom = "";
  String timeUntil = "";

  late TextEditingController dateController = TextEditingController();

  List<Map> spaceTypes = [
    {
      "display": "-",
      "value": "-",
    },
    {
      "display": "Running",
      "value": "Running",
    },
    {
      "display": "Climbing",
      "value": "Climbing",
    },
    {
      "display": "Walking",
      "value": "Walking",
    },
    {
      "display": "Swimming",
      "value": "Swimming",
    },
    {
      "display": "Soccer Practice",
      "value": "Soccer Practice",
    },
    {
      "display": "Baseball Practice",
      "value": "Baseball Practice",
    },
    {
      "display": "Football Practice",
      "value": "Football Practice",
    }
  ];


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
  ];

  /*static int todayHour = DateTime.now().hour;
  static int todayMinute = DateTime.now().minute;

  List<Map> createHourRange(DateTime dateTime) {
    List<Map> hourRange = [{"display": "", "value": ""}];
    int i = 8, j = 0;
    if (dateTime == DateTime.now()) {
      i = todayHour;
    }
    while (i <= 18) {
      j = j >= 60 ? 0 : 30;
      hourRange.add(hourAndMinuteToMap(i, j));
      j += 30;
    }
    i += 1;
    return hourRange;
  }

  Map hourAndMinuteToMap(int hour, int minute) =>
      {"display": "$hour:$minute", "value": "$hour:$minute"};*/

  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    // Clean up the controller when the widget is removed from the widget tree.
    dateController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _dropdownFormKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropDownList(
                  items: spaceTypes,
                  titleText: "Space type required",
                  setCurrentState: (String value) => selectedSpaceType = value),
              InkWell(
                onTap: () {
                  _selectDate(); // Call Function that has showDatePicker()
                },
                child: IgnorePointer(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Date"),
                    maxLength: 10,
                    controller: TextEditingController()
                      ..text = selectedDate,
                  ),
                ),
              ),
              DropDownList(
                  items: times,
                  titleText: "Time from",
                  setCurrentState: (String value) => timeFrom = value),
              DropDownList(
                  items: times,
                  titleText: "Time until",
                  setCurrentState: (String value) => timeUntil = value),

              TextFormField(
                  decoration: const InputDecoration(labelText: "Number of people"),
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
              ), TextFormField(
                  decoration: const InputDecoration(labelText: "Location"),
                  maxLength: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_dropdownFormKey.currentState!.validate()) {
                      print(selectedSpaceType);
                      print(selectedLikedCat);
                    }
                  },
                  child: const Text("Submit"))
            ],
          ),
        ));
  }

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: convertStringToDate(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 360)));
    if (picked != null) {
      setState(() => selectedDate = DateFormat('yyyy/MM/dd').format(picked));
    }
  }

  DateTime convertStringToDate() {
    return selectedDate == "Today"
        ? DateTime.now()
        : DateFormat('yyyy/MM/dd').parse(selectedDate);
  }
}
