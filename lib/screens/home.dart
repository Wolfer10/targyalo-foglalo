import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  Expanded(
                      child: Center(
                          child: Image(
                    image: AssetImage('assets/logo.png'),
                    width: 75,
                  )))
                ],
              ),
              const SizedBox(height: 20),
              const Image(
                  image: AssetImage('assets/meetingRoom2.webp')),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    AppLocalizations.of(context)!.meetingRooms,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Color.fromARGB(255, 57, 57, 57)),
                  ),
                  const SizedBox(height: 20),
                   Text(
                      AppLocalizations.of(context)!.description
                      , style: const TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          letterSpacing: 1.0,
                          color: Color.fromARGB(255, 57, 57, 57))),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/search');
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 229, 37, 0),
                            padding: const EdgeInsets.symmetric(horizontal: 125, vertical: 20)
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.bookNow, style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
