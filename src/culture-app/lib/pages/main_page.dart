import 'package:culture_app/pages/login.dart';
import 'package:flutter/material.dart';

import '../screen/jaw_page.dart';
import '../screen/sum_page.dart';
import '../services/firebase_sign_in.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0xffFFFEFB),
        child: Container(
          margin: EdgeInsets.only(top: 60, right: 28, left: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "BUDAYA KITA",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff00C82C),
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                      radius: 30,
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(fontSize: 23, color: Color(0xff52FF00)),
                    ),
                    Text(
                      "Temukan dan pelajari eksplorasi budaya barumu!",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff3E4957),
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: <Widget>[
                    Flexible(
                        flex: 8,
                        child: Row(
                          children: <Widget>[
                            Flexible(
                                flex: 5,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Sum()));
                                    },
                                    child: mainButton("sum", "Sumatera"))),
                            Spacer(
                              flex: 1,
                            ),
                            Flexible(
                                flex: 5,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Jaw()));
                                    },
                                    child: mainButton("jaw", "Jawa"))),
                          ],
                        )),
                    Spacer(
                      flex: 1,
                    ),
                    Flexible(
                        flex: 8,
                        child: Row(
                          children: <Widget>[
                            Flexible(flex: 5, child: mainButton("bal", "Bali")),
                            Spacer(
                              flex: 1,
                            ),
                            Flexible(
                                flex: 5,
                                child: mainButton("kal", "Kalimantan")),
                          ],
                        )),
                    Spacer(
                      flex: 1,
                    ),
                    Flexible(
                        flex: 8,
                        child: Row(
                          children: <Widget>[
                            Flexible(
                                flex: 5, child: mainButton("sul", "Sulawesi")),
                            Spacer(
                              flex: 1,
                            ),
                            Flexible(
                                flex: 5, child: mainButton("pap", "Papua")),
                          ],
                        )),
                    Spacer(
                      flex: 5,
                    ),
                    Flexible(
                        flex: 5,
                        child: Stack(children: <Widget>[
                          Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 1, color: Color(0xff52FF00)),
                                  color: Color(0xffffffff)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Flexible(
                                child: InkWell(
                                  onTap: () {
                                    signOutGoogle();
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (context) {
                                      return Login();
                                    }), ModalRoute.withName('/'));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Image(
                                          image: AssetImage(
                                              "assets/images/keluar_akun.png"),
                                          color: Colors.black,
                                          width: 40,
                                        ),
                                        const Text(
                                          "Logout",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffCB8655),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ])),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Text(
                  "“Beragam kebudayaan dalam satu keindahan”",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(180, 0, 0, 0)),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Stack mainButton(String gambar, String title) {
    return Stack(
      children: <Widget>[
        Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: Color(0xff52FF00)),
                color: Color(0xffffffff)),
          ),
        ),
        Column(
          children: <Widget>[
            Flexible(
                flex: 7,
                child: Container(
                  alignment: Alignment.center,
                  child:
                      Image(image: AssetImage("assets/images/log-$gambar.png")),
                )),
            Flexible(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff00C82C)),
                )),
          ],
        )
      ],
    );
  }
}
