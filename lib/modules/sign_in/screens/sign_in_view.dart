import 'package:flutter/material.dart';
import 'package:islami/const/customColor.dart';
import 'package:islami/modules/sign_in/services/login_service.dart';
import 'package:islami/modules/sign_up/screens/sign_up_view.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final GlobalKey _scaffold = GlobalKey();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProv = Provider.of<LoginService>(context);
    return Scaffold(
      key: _scaffold,
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 250,
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
                          text: "Assalamu'alaikum\n",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(
                          text: "Selamat Datang",
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
                        val.isEmpty ? "isi e-mail dahulu" : null,
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
                    obscureText: true,
                    controller: passCtrl,
                    keyboardType: TextInputType.text,
                    validator: (val) => val.length < 6
                        ? "Password harus lebih dari 6 karakter"
                        : null,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(primaryColor),
                      ),
                      labelText: "Masukkan password kamu",
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text("Lupa password ?"),
                  ),
                ),
                // SizedBox(height: 25),
                Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: RaisedButton(
                    onPressed: () async {
                      if (formKey.currentState.validate()) {
                        bool sigin = await loginProv.signIn(
                            emailCtrl.text, passCtrl.text);

                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  content: Consumer<LoginService>(
                                      builder: (context, loginserv, _) {
                                    if (loginserv.status ==
                                        Status.Authenticating) {
                                      return Container(
                                        width: 60,
                                        height: 60,
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      );
                                    } else {
                                      if (sigin) {
                                        return Text('Login Sukses');
                                      } else {
                                        return Text(
                                            'Login Gagal! Tolong periksa kembali Email dan Password kamu!');
                                      }
                                    }
                                  }),
                                ));
                      }
                    },
                    color: Color(0xFFFA6148),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpView(),
                        ));
                  },
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Belum punya akun?  ",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black54,
                          // fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: "Daftar sekarang",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
