import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'Login/emailogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'nav.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthenticationService service = AuthenticationService(FirebaseAuth.instance);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      drawer: Nav(),
      appBar: AppBar (
        backgroundColor: Colors.deepPurpleAccent,),
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          Center(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ))),
          InkWell(
              onTap: () {},
              child: DisplayImage(
                imagePath: ("https://static.wikia.nocookie.net/virtualyoutuber/images/5/53/Mythia_Batford_-_Portrait_2.jpg/revision/latest?cb=20220516070111&path-prefix=id"),
                onPressed: () {},
              )),
         const Text('Email : ',  style: TextStyle(height: 3, fontSize: 30)),
          Text("${service.firebaseAuth.currentUser?.email ?? ''}",style: TextStyle(fontSize: 20)),
        ],
      ),

    );
  }
}

  class DisplayImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  // Constructor
  const DisplayImage({
  Key? key,
  required this.imagePath,
  required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final color = Colors.black87;

  return Center(
  child: Stack(children: [
  buildImage(color),
  ]));
  }

  // Builds Profile Image
  Widget buildImage(Color color) {
  final image = imagePath.contains('https://')
  ? NetworkImage(imagePath)
      : FileImage(File(imagePath));

  return CircleAvatar(
  radius: 75,
  backgroundColor: color,
  child: CircleAvatar(
  backgroundImage: image as ImageProvider,
  radius: 70,
  ),
  );
  }


  // Builds/Makes Circle for Edit Icon on Profile Picture
  Widget buildCircle({
  required Widget child,
  required double all,
  }) =>
  ClipOval(
  child: Container(
  padding: EdgeInsets.all(all),
  color: Colors.white,
  child: child,
  ));
  }