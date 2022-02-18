import 'package:ogrenci_form/pages/form_page.dart';
import 'package:ogrenci_form/pages/register_page.dart';
import 'package:ogrenci_form/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool sifre = true;
  Color? sifrecolor = Colors.green;

  final _loginKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _loginKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset(
                'images/cicek.png',
                width: 250,
                height: 250,
              ),
               const SizedBox(
                height: 50,
              ),
              Text(
                "LOGİN SAYFASI",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(Icons.mail_outline, color: Colors.green),
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
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: sifre,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
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
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    prefixIcon: Icon(Icons.vpn_key, color: Colors.green),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                  ),
                  validator: (deger) {
                          if (deger != null && deger.isNotEmpty) if (deger.length >= 6) {
                            return null;
                          } else
                            return 'Geçerli Şifre Giriniz!';
                          else
                            return null;
                        },
                ),
              ),
            const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  child: Text(
                    "GİRİŞ",
                    style: TextStyle(color: Colors.white),
                  ),

                  onPressed: () {
                if (_loginKey.currentState!.validate()) {
                  _authService.signIn(_emailController.text, _passwordController.text)
                      .then<dynamic>((dynamic value) {         
                    if (value != null ) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Form_Page()));
                           EasyLoading.showSuccess("Giriş Başarılı",
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
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),


                Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  child: Text(
                    "KAYIT OL",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Register_Page()));

              },  
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
