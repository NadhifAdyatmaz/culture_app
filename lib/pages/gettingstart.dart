import 'package:flutter/material.dart';

import 'register.dart';

class GettingStart extends StatelessWidget {
  const GettingStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color(0xffffffff),
          width: MediaQuery.of(context).size.width,
          child: Container(
            margin: EdgeInsets.only(top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text(
                  "KEBUDAYAAN DAERAH",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff00C82C),
                  ),
                ),
                Image(image: AssetImage("images/dash-1.png")),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Text(
                    "“Beragam kebudayaan dalam satu keindahan”",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(180, 0, 0, 0)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Material(
                    borderRadius: BorderRadius.circular(30),
                    elevation: 3,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff52FF00)),
                      child: Material(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const Register();
                            }));
                          },
                          child: const Center(
                            child: Text(
                              "AYO",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffffffff),
                                  shadows: <Shadow>[
                                    Shadow(
                                        color: Color.fromARGB(64, 0, 0, 0),
                                        offset: Offset(0, 4),
                                        blurRadius: 4)
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
