import 'package:flutter/material.dart';

import '../services/firebase_sign_in.dart';
import 'login.dart';
import 'main_page.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  List<String> labelStr = [
    "Nama Lengkap",
    "Username",
    "Email",
    "Phone",
    "Password",
  ];
  List<Widget> widgets = [];

  _RegisterState() {
    for (int i = 0; i < labelStr.length; i++) {
      widgets.add(fieldDaftar(labelStr[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color(0xffffffff),
          child: Container(
            margin: EdgeInsets.only(top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text(
                  "REGISTER",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff00C82C),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child:
                            Image(image: AssetImage("assets/images/req.png")),
                        height: 350,
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.73,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: widgets,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width * 0.73,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Sudah Memiliki Akun? ",
                              style: TextStyle(fontSize: 18),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Login();
                                }));
                              },
                              child: Text(
                                "Login!",
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xff52FF00)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(25),
                        elevation: 3,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Color(0xff52FF00)),
                          child: Material(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MainPage();
                                }));
                              },
                              child: const Center(
                                child: Text(
                                  "Daftar",
                                  style: TextStyle(
                                      fontSize: 25,
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
                      Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Atau",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      _signInButton()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField fieldDaftar(String label) {
    return TextField(
      decoration: InputDecoration(
          labelText: label, labelStyle: TextStyle(color: Color(0xff82916A))),
    );
  }

  Widget _signInButton() {
    return OutlinedButton(
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const MainPage();
            }));
          }
        });
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Color.fromRGBO(255, 255, 255, 0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Image.asset(
          'assets/images/google.png',
          height: 25,
          width: MediaQuery.of(context).size.width * 0.1,
        ),
      ),
    );
  }
}
