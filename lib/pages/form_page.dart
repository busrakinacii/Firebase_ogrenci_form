import 'package:flutter/material.dart';
import 'package:ogrenci_form/pages/list_detail_page.dart';
import 'package:ogrenci_form/pages/list_page.dart';
import 'package:ogrenci_form/pages/login.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:ogrenci_form/services/form_service.dart';

class Form_Page extends StatefulWidget {
  const Form_Page({Key? key}) : super(key: key);

  @override
  _Form_Page createState() => _Form_Page();
}
class _Form_Page extends State<Form_Page> {
  FormService _formService = FormService();
  bool sifre = true;
  Color? sifrecolor = Colors.green;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _birthmoonController = TextEditingController();
  final TextEditingController _birthyearController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _sectionController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _birthdayController.dispose();
     _birthmoonController.dispose();
      _birthyearController.dispose();
    super.dispose();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ÖĞRENCİ KAYIT FORMU'),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 20,
        shadowColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Form Bİlgilerini Giriniz...',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    controller: _sectionController,
                    validator: (v) {
                      if (v != null &&
                          v.isNotEmpty &&
                          v.length > 5) if (v.split(' ').length > 1)
                        return null;
                      else
                        return 'Zorunlu Alan';
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        labelText: 'Bölüm(*)',
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        )),
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    validator: (s) {
                      if (s != null && s.isNotEmpty && s.length == 15)
                        return null;
                      else
                        return 'Zorunlu alan*';
                    },
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      MaskedInputFormatter('#(###)### ## ##'),
                    ],
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        hintText: '0(___)___ __ __',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: 'Telefon Numarası(*)',
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        )),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Doğum Tarihi(*)',
                          style: TextStyle(color: Colors.black),
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _birthdayController,
                                inputFormatters: [
                                  /**user can put just number */
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (s) {
                                  if (s != null &&
                                      s.isNotEmpty &&
                                      s.length == 2 &&
                                      (int.parse(s) < 32 && int.parse(s) > 0))
                                    return null;
                                  else
                                    return 'Zorunlu alan*';
                                },
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                    labelText: 'Gün',
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    labelStyle: TextStyle(color: Colors.black),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              '/',
                              textScaleFactor: 1.4,
                              textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.green),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: TextFormField(
                                inputFormatters: [
                                  /**user can put just number */
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                validator: (s) {
                                  if (s != null &&
                                      s.isNotEmpty &&
                                      s.length == 2 &&
                                      (int.parse(s) < 13 && int.parse(s) > 0))
                                    return null;
                                  else
                                    return 'Zorunlu alan*';
                                },
                                controller: _birthmoonController,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: const InputDecoration(
                                    labelText: 'Ay',
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              '/',
                              textScaleFactor: 1.4,
                              textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.green),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: TextFormField(
                                inputFormatters: [
                                  /**user can put just number */
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                validator: (s) {
                                  if (s != null &&
                                      s.isNotEmpty &&
                                      s.length == 4) {
                                    if (2022 - int.parse(s) < 25) {
                                      return null;
                                    } else {
                                      return 'Geçersiz yaş sınırı';
                                    }
                                  } else
                                    return 'Zorunlu alan*';
                                },
                                controller: _birthyearController,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                    labelText: 'Yıl',
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    labelStyle: TextStyle(color: Colors.black),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    controller: _addressController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        labelText: 'Adres',
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                        )),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () {
                       if (_formKey.currentState!.validate()) {
                  _formService
                     .addForm(_sectionController.text,_addressController.text,_phoneController.text,_birthdayController.text, _birthmoonController.text, _birthyearController.text)
                      .then<dynamic>((dynamic value) {         
                    if (value != null ) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ListPage()));
                           EasyLoading.showSuccess("Form Gönderildi",
                          dismissOnTap: true);                      
                    } else {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("HATA"),
                              content: Text("Bilgilerinizi Doğru Giriniz."),
                              actions: <Widget>[
                                MaterialButton(
                                  child: Text("Geri Dön"),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            );
                          });
                    }
                  });
                 }
              },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    child: Container(
                      decoration: const BoxDecoration(
                        color:Colors.green,
                          borderRadius:
                              BorderRadius.all(Radius.circular(80.0))),
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Text('Bilgileri Onayla',
                          style: TextStyle(fontSize: 20)),
                    ),
                  
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  dynamic loadingShow() {
    return showDialog<String>(
        context: context,
        builder: (ctx) => Material(
              type: MaterialType.transparency,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(
                      color: Colors.green,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Bilgileriniz kaydediliyor.\nLütfen bekleyiniz...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
