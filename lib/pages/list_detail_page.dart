/* 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ogrenci_form/pages/list_page.dart';


class ListPageDetail extends StatefulWidget {
  @override
  _ListPageDetailState createState() => _ListPageDetailState();
}

class  _ListPageDetailState  extends  State<ListPageDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Sayfası"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => ListPage()),
                  (Route<dynamic> route) => true);
            },
          ),
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((deger) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => ListPage()),
                      (Route<dynamic> route) => false);
                });
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => ListPage()),
                (Route<dynamic> route) => true);
          }),
      body: Container(
        child: Profil(),
      ),
    );
  }
}
 
class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
 
    Query blogYazilari = FirebaseFirestore.instance
        .collection('Person')
        .where("email", isEqualTo: auth.currentUser!.uid);
 
    return StreamBuilder<QuerySnapshot>(
      stream: blogYazilari.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Bir şeyler yanlış gitti');
        }
 
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Yükleniyor");
        }
 
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            return  ListTile(
              title: Text("${document['section']}"), 
              subtitle:Text("${document['address']}"), 
            );
          }).toList(),
        );
      },
    );
  }
}

*/