import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';

Future createPemasukan (Pemasukan pemasukan) async {
  final docPemasukan = FirebaseFirestore.instance.collection('Pencatatan').doc();
      pemasukan.id = docPemasukan.id;

  final json = pemasukan.toJson();
      await docPemasukan.set(json);
}

Future createKeinginan (Keinginan keinginan) async {
  final docKeinginan = FirebaseFirestore.instance.collection('Wish').doc();
  keinginan.id = docKeinginan.id;

  final json = keinginan.toJson();
  await docKeinginan.set(json);
}