import 'package:flutter/material.dart';

import '../services/firebase_sign_in.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profil Saya',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 0, 255, 42)
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: 80,
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 40),
              const Text(
                'Nama: ',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                name,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              const Text(
                'Email',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                email,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
