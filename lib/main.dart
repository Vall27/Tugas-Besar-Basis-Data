import 'package:basdatfinal/Login/mainPage.dart';
import 'package:basdatfinal/wish.dart';
import 'package:flutter/material.dart';
import 'package:basdatfinal/Login/logingan.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'crit.dart';

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
  }


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        home: MyLoginPage(),
      );
}
class crud extends StatefulWidget {
  const crud({Key? key}) : super(key: key);

  @override
  State<crud> createState() => _crudState();
}

class _crudState extends State<crud> {
    final controllerJenis = TextEditingController();
    final controllerJumlah = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.deepPurpleAccent,
        leading: IconButton(icon: Icon(Icons.arrow_back),
      onPressed: (){Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MyDashboard()),
      );
      },
    )),
body: ListView(
  padding: EdgeInsets.all(16),
  children: <Widget>[
    Text('Jenis'),
    TextField(
      controller: controllerJenis,
    ),
    const SizedBox(height: 24),
    Text('Jumlah'),
    TextField(
      controller: controllerJumlah,
    ),
    const SizedBox(height: 24),
    ElevatedButton(
      onPressed: (){
       final pemasukan = Pemasukan(
        jenis: controllerJenis.text,
        jumlah:int.parse(controllerJumlah.text),
      );
      createPemasukan(pemasukan);
       Navigator.pushReplacement(
           context,
           MaterialPageRoute(
               builder: (context) => MyDashboard())
       );
    },
        child: Text ('Tambah Data',),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
    )
    )
  ],
)
  );
}

class Pemasukan {
    String id;
    final String jenis;
    final int jumlah;

    Pemasukan({
      this.id = '',
    required this.jenis,
      required this.jumlah,
});
    Map<String, dynamic> toJson() => {
      'id' : id,
      'jenis' : jenis,
      'jumlah' : jumlah,
    };
    static Pemasukan fromJson (Map<String, dynamic> json) => Pemasukan(
      id: json['id'],
      jenis: json['jenis'],
      jumlah: json ['jumlah'],
    );
}

Stream<List<Pemasukan>> readPencatatan() => FirebaseFirestore.instance.collection('Pencatatan')
    .snapshots()
    .map((snapshot) => snapshot.docs.map((doc) =>Pemasukan.fromJson(doc.data())).toList());



class ingin extends StatefulWidget {
  const ingin({Key? key}) : super(key: key);

  @override
  State<ingin> createState() => _inginState();
}

class _inginState extends State<ingin> {
  final controllerBarang = TextEditingController();
  final controllerHarga = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => wishlist()),
              );
            },
          )),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          Text('Barang'),
          TextField(
            controller: controllerBarang,
          ),
          const SizedBox(height: 24),
          Text('Harga'),
          TextField(
            controller: controllerHarga,
          ),
          const SizedBox(height: 24),
          ElevatedButton(onPressed: (){
            final keinginan = Keinginan(
              barang: controllerBarang.text,
              harga:int.parse(controllerHarga.text),
            );
            createKeinginan(keinginan);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => wish()));
          },
            child: Text ('Tambah Data'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
              )
          )
        ],
      )
  );
}

class Keinginan {
  String id;
  final String barang;
  final int harga;

  Keinginan({
    this.id = '',
    required this.barang,
    required this.harga,
  });
  Map<String, dynamic> toJson() => {
    'id' : id,
    'barang' : barang,
    'harga' : harga,
  };
  static Keinginan fromJson (Map<String, dynamic> json) => Keinginan(
    id: json['id'],
    barang: json['barang'],
    harga: json ['harga'],
  );
}
Stream<List<Keinginan>> readWish() => FirebaseFirestore.instance.collection('Wish')
    .snapshots()
    .map((snapshot) => snapshot.docs.map((doc) =>Keinginan.fromJson(doc.data())).toList());

