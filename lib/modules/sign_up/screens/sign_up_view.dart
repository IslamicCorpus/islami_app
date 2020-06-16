import 'package:flutter/material.dart';
import 'package:islami/const/customColor.dart';
import 'package:islami/modules/sign_in/services/login_service.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final namaCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(primaryColor),
        elevation: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(15)),
                    color: Color(primaryColor),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Daftar baru\n\n",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(
                          text:
                              "Dapatkan konten menarik yang dapat kamu ambil hikmahnya",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w300,
                          )),
                    ])),
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) =>
                        val.isEmpty ? "Isi e-mail dahulu" : null,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Color(primaryColor),
                      ),
                      labelText: "Masukkan alamat email",
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: namaCtrl,
                    validator: (val) => val.isEmpty ? "Isi nama dahulu" : null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Color(primaryColor),
                      ),
                      labelText: "Nama lengkap",
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: passCtrl,
                    validator: (val) => val.length < 6
                        ? "Password harus lebih dari 6 huruf"
                        : null,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(primaryColor),
                      ),
                      labelText: "Masukkan password kamu",
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: RaisedButton(
                    onPressed: () async {
                      if (formKey.currentState.validate()) {
                        bool regist = await Provider.of<LoginService>(context,
                                listen: false)
                            .signUp(
                          emailCtrl.text,
                          passCtrl.text,
                          namaCtrl.text,
                        );

                        if (regist) {
                          Navigator.pop(context);
                        } else {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    content: Text('Email sudah dipakai !!'),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Close'))
                                    ],
                                  ));
                        }

                        //nanti di buat loading untuk menu utama hehe
                      }
                    },
                    color: Color(0xFFFA6148),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "Daftar sekarang",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
