import 'package:cloud_firestore/cloud_firestore.dart';

class Form {
  String id;
  String section;
  String address;
  String phone;
  String birthday;
  String birthmoon;
  String birthyear;

  Form({required this.id, required this.section, required this.address, required this.phone, required this.birthday, required this.birthmoon, required this.birthyear });

  factory Form.fromSnapshot(DocumentSnapshot snapshot) {
    return Form(
      id: snapshot.id,
      section: snapshot["section"],
      address: snapshot["address"],
      phone: snapshot["phone"],
      birthday: snapshot["birthday"],
      birthmoon: snapshot["birthmoon"],
      birthyear: snapshot["birthyear"],

    );
  }
}