import 'package:flutter/material.dart';
import 'package:targyalo_foglalo/screens/form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.search),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 229, 37, 0),
        ),
        body: Container(
          color: const Color.fromARGB(255, 244, 243, 240),
          child: Column(
            children: const <Widget>[
              SearchForm(),
            ],
          ),
        ),
      ),
    );
  }
}
