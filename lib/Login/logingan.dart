import 'package:basdatfinal/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'emailogin.dart';
import 'mainPage.dart';
import 'Regist.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyLoginPage(),
    );
  }
}
class MyLoginPage extends StatefulWidget {
  @override

  _MyLoginPageState createState() => _MyLoginPageState();
}
class _MyLoginPageState extends State<MyLoginPage> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: Text(
                    'Welcome',
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
              onPressed: ()async {
    try {
    final user = await _auth.signInWithEmailAndPassword(
    email: email, password: password);
    if (user != null) {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => ProfilePage()));
    }
    } catch (e) {
    print(e);
    }
                  },
              child: Text("LogIn",style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )
              ),
            ),
          RaisedButton(
            textColor: Colors.white,
            color: Colors.black87,
            onPressed: (){Navigator.push(context,
    MaterialPageRoute(builder: (context) => daftar()));
            },
            child: Text('Sign Up',
            style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.white,
            )
            ),
          )
        ],
        ),
      );
  }
}