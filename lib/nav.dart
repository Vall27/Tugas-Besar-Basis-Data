import 'package:basdatfinal/Login/mainPage.dart';
import 'package:basdatfinal/user.dart';
import 'package:basdatfinal/wish.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Login/emailogin.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Login/logingan.dart';

class Nav extends StatelessWidget {
  AuthenticationService service = AuthenticationService(FirebaseAuth.instance);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('User'),
            accountEmail: Text("${service.firebaseAuth.currentUser?.email ?? ''}"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://static.wikia.nocookie.net/virtualyoutuber/images/5/53/Mythia_Batford_-_Portrait_2.jpg/revision/latest?cb=20220516070111&path-prefix=id',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxG--bot1hPumNDSLDOwOL_6uw1uaB6TEGYQ&usqp=CAU')
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profiles'),
            onTap: () {Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => ProfilePage()),
            );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet_rounded),
            title: Text('Keuangan'),
            onTap: () {Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => MyDashboard()),
            );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Wishlist'),
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => wishlist()),
      );
    },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async {
          GoogleSignIn googleSignIn = GoogleSignIn();
          await FirebaseAuth.instance.signOut();
          if (await googleSignIn.isSignedIn()) {
          googleSignIn.disconnect();
          }
          if (FirebaseAuth.instance.currentUser == null)
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
          builder: (context) => MyLoginPage())
              );
            },
          ),
        ],
      ),
    );
  }
}