import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login/emailogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:basdatfinal/main.dart';
import 'package:basdatfinal/nav.dart';

class wish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: wishlist(),
    );
  }
}
class wishlist extends StatefulWidget {

  const wishlist({Key? key}) : super(key: key);
  @override
  _wishlistState createState() => _wishlistState();
}
class _wishlistState extends State<wishlist> {
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
        backgroundColor: Colors.deepPurpleAccent),
    body: StreamBuilder <List<Keinginan>>(
        stream: readWish(),

        builder: (context,snapshot) {
          if(snapshot.hasError){
            return Text ('Wishlist Kamu Masih Kosong....');
          }else if (snapshot.hasData) {
            final Keinginan = snapshot.data!;
            return ListView(
              children: Keinginan.map(buildKeinginan).toList(),
            );}else {
            return Center (child: CircularProgressIndicator());
          }
        }),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.pushReplacement(context,
            new MaterialPageRoute(builder: (context) => ingin()));
      },
      backgroundColor: Colors.deepPurpleAccent,
      child: const Icon(Icons.add),
    ),
  );

  Widget buildKeinginan(Keinginan keinginan) => ListTile(
    title: Text(keinginan.barang),
    subtitle: Text(keinginan.harga.toString()),
  );

}