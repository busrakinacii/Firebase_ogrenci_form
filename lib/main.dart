import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ogrenci_form/pages/list_detail_page.dart';
import 'package:ogrenci_form/pages/list_page.dart';
import 'package:ogrenci_form/pages/login.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,
       builder: EasyLoading.init(),
      
    );
  }
}



