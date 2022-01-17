import 'package:flutter/material.dart';

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
                  image: NetworkImage(
                      'https://assets.iwgplc.com/image/upload/c_fill,f_auto,q_auto,ar_16:9,w_556,h_312,g_auto:subject/Sitecore/CD/-/media/regus/images/solutions-and-features/meeting-room/s_mr_header_01.ashx')),
              Container(
                color: const Color.fromARGB(255, 244, 243, 240),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Meeting Rooms.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Color.fromARGB(255, 57, 57, 57)),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                          "Our meeting rooms are in every major city in the world, so you can host wherever you need. Impress clients, hold memorable workshops, or deliver a winning pitch in our fully-serviced meeting spaces. Book on-demand by the hour, and our dedicated team will be on hand to ensure your meeting runs smoothly.",
                          style: TextStyle(
                              fontSize: 15,
                              height: 1.5,
                              letterSpacing: 1.0,
                              color: Color.fromARGB(255, 57, 57, 57))),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 229, 37, 0),
                                padding: const EdgeInsets.symmetric(horizontal: 125, vertical: 20)
                            ),
                            child: Text(
                              'Book now'.toUpperCase(), style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
