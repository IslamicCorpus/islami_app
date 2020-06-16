import 'package:flutter/material.dart';
import 'package:islami/const/customColor.dart';
import 'package:islami/modules/profile/services/profile_services.dart';
import 'package:islami/modules/profile/widgets/CustomListTileProfile.dart';
import 'package:islami/modules/profile/widgets/profile_image_widget.dart';
import 'package:islami/modules/sign_in/services/login_service.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:islami/modules/profile/widgets/change_gender.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String selectionValue;
  @override
  Widget build(BuildContext context) {
    final loginProv = Provider.of<LoginService>(context);
    final profileProv = Provider.of<ProfileService>(context);
    final namaCtrl = TextEditingController(text: loginProv.profileModel.name);
    // final genderCtrl =
    //     TextEditingController(text: loginProv.profileModel.gender);

    final formKey = GlobalKey<FormState>();

    void showToast(String msg, {int duration, int gravity}) {
      Toast.show(msg, context, duration: duration, gravity: gravity);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(primaryColor),
        leading: Container(),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                loginProv.signOut();
              },
              // color: Colors.black,
            ),
          )
        ],
        elevation: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 40),
                ProfileImageWidget(urlimage: loginProv.profileModel.urlimage),
                SizedBox(height: 50),
                CustomListTileProfile(
                  leading: Icons.account_circle,
                  title: "Nama lengkap",
                  subtitle: loginProv.profileModel.name,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: TextFormField(
                            controller: namaCtrl,
                            validator: (val) =>
                                val.isEmpty ? "Nama tidak boleh kosong" : null,
                            decoration: InputDecoration(
                              labelText: "Ganti nama profile",
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Batal"),
                            ),
                            FlatButton(
                              onPressed: () {
                                profileProv.updateDocument(
                                    loginProv.profileModel.id,
                                    {"nama": namaCtrl.text}).then((result) {
                                  showToast("Berhasil mengganti nama",
                                      duration: Toast.LENGTH_LONG);
                                  Navigator.pop(context);
                                }).catchError((onError) {
                                  showToast("Uppss.. cek kembali koneksi",
                                      duration: Toast.LENGTH_LONG);
                                  Navigator.pop(context);
                                });
                              },
                              child: Text("Selesai"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                CustomListTileProfile(
                  leading: Icons.cached,
                  title: "Jenis kelamin",
                  subtitle: loginProv.profileModel.gender,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeGender(),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
