import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'logingan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:basdatfinal/main.dart';
import 'emailogin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:basdatfinal/nav.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyDashboard(),
    );
  }
}
class MyDashboard extends StatefulWidget {

  const MyDashboard({Key? key}) : super(key: key);
  @override
  _MyDashboardState createState() => _MyDashboardState();
}
class _MyDashboardState extends State<MyDashboard> {
  AuthenticationService service = AuthenticationService(FirebaseAuth.instance);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override

  Widget build(BuildContext context)  => Scaffold (
    drawer: Nav(),
    appBar: AppBar (
      backgroundColor: Colors.deepPurpleAccent,
    ),
    body: StreamBuilder <List<Pemasukan>>(
        stream: readPencatatan(),
        builder: (context,snapshot) {
          if(snapshot.hasError){
            return Text ('Pencatatan Kamu Masih Kosong....');
          }else if (snapshot.hasData) {
            final Pemasukan = snapshot.data!;
            return ListView(
              children: Pemasukan.map(buildPemasukan).toList(),
            );}else {
            return Center (child: CircularProgressIndicator());
          }
        }),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.pushReplacement(context,
            new MaterialPageRoute(builder: (context) => crud()));
      },
      backgroundColor: Colors.deepPurpleAccent,
      child: const Icon(Icons.add),
    ),
  );

  Widget buildPemasukan(Pemasukan pemasukan) => ListTile(
    title: Text(pemasukan.jenis),
    subtitle: Text(pemasukan.jumlah.toString()),
  );

}

