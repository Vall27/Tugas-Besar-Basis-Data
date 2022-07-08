import 'package:basdatfinal/user.dart';

import 'mainPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class daftar extends StatefulWidget {
  const daftar({Key? key}) : super(key: key);

  @override
  State<daftar> createState() => _daftarState();
}

class _daftarState extends State<daftar> with InputValidationMixin {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  final formGlobalKey = GlobalKey<FormState>();
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
    children : [
      Center(
      child: Padding(
      padding: EdgeInsets.only(top: 45),
      child: Text(
      'SIGN UP HERE',
      style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: Colors.black87,
      ),
      ))),

    Padding(
    padding: EdgeInsets.only(top: 50,left: 30,right: 30),
    child: TextField(
    onChanged: (value) {
    email = value;
    },
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Email',
    ),
    ),
    ),
    Padding(
    padding: EdgeInsets.only(top: 10,left: 30,right: 30,bottom: 30),
    child: TextField(
    onChanged: (value) {
    password = value;
    },
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Password',
    ),
    ),
          ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.black87,
                  onPressed: ()  async {
    try {
    final newUser = await _auth.createUserWithEmailAndPassword(
    email: email, password: password);
    if (newUser != null) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => ProfilePage()));;
    }
    } catch (e) {
    print(e);
    }
                    },
                  child: Text('Sign Up',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  )
              ),
          ),
        ],
              ),
      );
  }
}

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length >= 6;

  bool isEmailValid(String email) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regex.hasMatch(email);
  }
}
