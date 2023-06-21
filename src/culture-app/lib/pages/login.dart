import 'package:flutter/material.dart';

import '../services/firebase_sign_in.dart';
import 'main_page.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: const Color(0xffffffff),
          child: Container(
            margin: const EdgeInsets.only(top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff00C82C),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      child: const Image(
                        image: AssetImage("assets/images/reg-1.png"),
                        height: 300,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.73,
                      child: Column(
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: fieldMasuk("Username")),
                          fieldMasuk("Password"),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width * 0.73,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Belum Memiliki Akun? ",
                              style: TextStyle(fontSize: 18),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const Register();
                                }));
                              },
                              child: const Text(
                                "Daftar!",
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
                              color: const Color(0xff52FF00)),
                          child: Material(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const MainPage();
                                }));
                              },
                              child: const Center(
                                child: Text(
                                  "Masuk",
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

  TextField fieldMasuk(String label) {
    return TextField(
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Color(0xff82916A))),
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
