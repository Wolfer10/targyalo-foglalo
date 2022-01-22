import 'package:flutter/material.dart';
import 'package:targyalo_foglalo/screens/form.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 244, 243, 240),
          child: Column(
            children: const <Widget>[
              Text("Space type required"),
              SearchForm(),
            ],
          ),
        ),
      ),
    );
  }
}
