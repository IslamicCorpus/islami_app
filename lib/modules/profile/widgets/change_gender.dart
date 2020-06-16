import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:islami/modules/profile/services/profile_services.dart';
import 'package:islami/modules/sign_in/services/login_service.dart';

class ChangeGender extends StatefulWidget {
  @override
  _ChangeGenderState createState() => _ChangeGenderState();
}

class _ChangeGenderState extends State<ChangeGender> {
  String selectionValue;

  @override
  Widget build(BuildContext context) {
    final profileProv = Provider.of<ProfileService>(context);

    final loginProv = Provider.of<LoginService>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              profileProv.updateDocument(loginProv.profileModel.id,
                  {"gender": selectionValue}).then((result) {
                profileProv.showToast("Berhasil mengganti data", context);
                Navigator.pop(context);
              }).catchError((onError) {
                profileProv.showToast("Uppss...", context);
                Navigator.pop(context);
              });
            },
            child: Text("Selesai"),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: DropdownButton<String>(
            value: selectionValue,
            hint: Text("Jenis kelamin"),
            items: <String>['Laki-laki', 'Perempuan'].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                selectionValue = newValue;
              });
            },
          ),
        ),
      ),
    );
  }
}

// showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           content: DropdownButton<String>(
//                             value: selectionValue,
//                             hint: Text("Jenis kelamin"),
//                             items: <String>['A', 'B', 'C', 'D']
//                                 .map((String value) {
//                               return new DropdownMenuItem<String>(
//                                 value: value,
//                                 child: new Text(value),
//                               );
//                             }).toList(),
//                             onChanged: (String newValue) {
//                               setState(() {
//                                 selectionValue = newValue;
//                               });
//                             },
//                           ),
//                           actions: <Widget>[
//                             FlatButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               child: Text("Batal"),
//                             ),
//                             FlatButton(
//                               onPressed: () {
//                                 profileProv.updateDocument(
//                                     loginProv.profileModel.id,
//                                     {"gender": genderCtrl.text}).then((result) {
//                                   showToast("Berhasil mengganti data",
//                                       duration: Toast.LENGTH_LONG);
//                                   Navigator.pop(context);
//                                 }).catchError((onError) {
//                                   showToast("Uppss.. cek kembali koneksi",
//                                       duration: Toast.LENGTH_LONG);
//                                   Navigator.pop(context);
//                                 });
//                               },
//                               child: Text("Selesai"),
//                             ),
//                           ],
//                         );
//                       },
//                     );
