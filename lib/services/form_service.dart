import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ogrenci_form/pages/model/form.dart';
import 'package:ogrenci_form/services/auth_service.dart';

class FormService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Form eklemek için
  Future<Form> addForm(String section, String address, String phone, String birthday, String birthmoon, String birthyear ) async {
    var ref = _firestore.collection("Form");

    var documentRef = await ref.add({'section': section, 'address': address, 'phone': phone, 'birthday': birthday, 'birthmoon': birthmoon, 'birthyear': birthyear,});

    return Form(id: documentRef.id, section: section, address: address, phone: phone, birthday: birthday, birthmoon: birthmoon, birthyear: birthyear);
  }

  //Form göstermek için
  Stream<QuerySnapshot> getForm() {
    var ref = _firestore.collection("Form").snapshots();

    return ref;
  }

  //Form silmek için
  Future<void> removeForm(String docId) {
    var ref = _firestore.collection("Form").doc(docId).delete();

    return ref;
  }
}
