import 'package:flutter/material.dart';
import 'package:ogrenci_form/pages/login.dart';
import 'package:ogrenci_form/services/auth_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class Register_Page extends StatefulWidget {
  const Register_Page({Key? key}) : super(key: key);

  @override
  _Register_Page createState() => _Register_Page();
}

class _Register_Page extends State<Register_Page> {
  bool sifre = true;
  Color? sifrecolor = Colors.green;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 20,
          shadowColor: Colors.green,
          centerTitle: true
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                   const SizedBox(
                height: 50,
              ),
              Text(
                "KAYIT SAYFASI",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.all(15.0)),
                TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      labelText: 'Adınız',
                      hintText: 'Adı',
                      prefixIcon: Icon(Icons.person_pin, color: Colors.green),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                    ),
                      
                    validator: (deger) {
                      if (deger != null && 
                      deger.isNotEmpty && 
                      deger.length > 20) if (deger.split(' ').length > 1)
                        return null;
                      else
                        return 'Zorunlu Alan';
                    }),
                   Padding(padding: const EdgeInsets.all(15.0)),
                   TextFormField(
                    controller: _surnameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      labelText: 'Soyadınız',
                      hintText: 'Soyad',
                      prefixIcon: Icon(Icons.person_pin, color: Colors.green),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                    ),
                    validator: (deger) {
                      if (deger != null && 
                      deger.isNotEmpty && 
                      deger.length > 15) if (deger.split(' ').length > 1)
                        return null;
                      else
                        return 'Zorunlu Alan';
                    }),


                Padding(padding: const EdgeInsets.all(7.0)),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    labelText: 'Email',
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.mail, color: Colors.green),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                  ),
                  validator: (mail) {
                    if (mail!.isEmpty) {
                      return null;
                    } else if (!EmailValidator.validate(mail)) {
                      return 'Geçerli Mail Giriniz.';
                    } else
                      return null;
                  },
                ),
                Padding(padding: const EdgeInsets.all(7.0)),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: sifre,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    labelText: 'Şifre',
                    hintText: 'Şifre',
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: sifrecolor,
                      ),
                      onPressed: () {
                        setState(() {
                          sifre = !sifre;
                          sifre
                              ? sifrecolor = Colors.grey
                              : sifrecolor = Colors.green;
                        });
                      },
                    ),
                    prefixIcon: Icon(Icons.vpn_key, color: Colors.green),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                  ),
                   autocorrect: false,
                        validator: (deger) {
                          if (deger != null && deger.isNotEmpty) if (deger.length >= 6) {
                            return null;
                          } else
                            return 'Şifre en az 6 karakterden oluşmalıdır!';
                          else
                            return null;
                        },
                ),
            
                Padding(padding: const EdgeInsets.all(7.0)),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    child: Text(
                      "Kaydol",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: ()  {
                     if (_formKey.currentState!.validate()) {
                  _authService
                     .createPerson(_nameController.text,_surnameController.text,_emailController.text, _passwordController.text)
                      .then<dynamic>((dynamic value) {         
                    if (value != null ) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()));
                           EasyLoading.showSuccess("Kayıt İşlemi Başarılı",
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
                        style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

