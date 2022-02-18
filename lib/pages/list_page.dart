import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ogrenci_form/services/form_service.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  FormService _formService = FormService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   
    return StreamBuilder<QuerySnapshot>(
      stream: _formService.getForm(),
      builder: (context, snaphot) {
        return !snaphot.hasData
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: snaphot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot mypost = snaphot.data!.docs[index];

                  Future<void> _showChoiseDialog(BuildContext context) {
                    return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text(
                                "Silmek istediğinize emin misiniz?",
                                textAlign: TextAlign.center,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              content: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          _formService.removeForm(mypost.id);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Evet",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Vazgeç",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  )));
                        });
                  }

                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                      onTap: () {
                        _showChoiseDialog(context);
                      },
                      child: Container(
                        height: size.height * .1,
                        decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            border: Border.all(color: Colors.green, width: 3),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${mypost['section']}",
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${mypost['birthday']}",
                                        style: TextStyle(fontSize: 15),
                                        textAlign: TextAlign.center,
                                      ),
                                      const Text(
                                        '/',
                                        textScaleFactor: 1.4,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      Text(
                                        "${mypost['birthmoon']}",
                                        style: TextStyle(fontSize: 15),
                                        textAlign: TextAlign.center,
                                      ),
                                      const Text(
                                        '/',
                                        textScaleFactor: 1.4,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      Text(
                                        "${mypost['birthyear']}",
                                        style: TextStyle(fontSize: 15),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${mypost['phone']}",
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${mypost['address']}",
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
      },
    );
  }
}
