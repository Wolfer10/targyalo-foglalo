import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:provider/provider.dart';

class DropDownList extends StatefulWidget {
  final List<Map> items;
  final String titleText;
  final String hintText;
  final Function setCurrentState;

  const DropDownList(
      {Key? key,
      required this.items,
      required this.titleText,
        required this.setCurrentState,
      this.hintText = "please choose one"})
      : super(key: key);

  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String currentValue = '-';


  @override
  Widget build(BuildContext context) {
    return DropDownFormField(

      titleText: widget.titleText,
      hintText: widget.hintText,
      value: currentValue,
      onSaved: (value) {
        setState(() {
          currentValue = value;
          widget.setCurrentState(value);
        });
      },
      onChanged: (value) {
        setState(() {
          currentValue = value;
          widget.setCurrentState(value);
        });
      },
      dataSource: widget.items,
      textField: 'display',
      valueField: 'value',
    );
  }
}
