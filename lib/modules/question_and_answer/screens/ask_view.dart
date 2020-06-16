import 'package:flutter/material.dart';
import 'package:islami/modules/question_and_answer/services/ask_service.dart';
import 'package:islami/modules/sign_in/services/login_service.dart';
import 'package:provider/provider.dart';

class AskView extends StatelessWidget {
  final String question;
  AskView({this.question});
  @override
  Widget build(BuildContext context) {
    final askProv = Provider.of<AskService>(context);
    final loginProv = Provider.of<LoginService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Tanya"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.white,
            ),
            onPressed: () {
              askProv.addDocument({
                "sender": loginProv.profileModel.name,
                "senderId": loginProv.profileModel.id,
                "question": askProv.askCtrl.text,
                "urlimagesender": loginProv.profileModel.urlimage,
                "created": DateTime.now().toUtc().millisecondsSinceEpoch,
              }).then((value) {
                Navigator.pop(context);
                askProv.showToast("Pertanyaan kamu berhasil diunggah", context);
                askProv.askCtrl.clear();
              }).catchError((onError) {
                askProv.showToast("Upss.. ada kesalahan", context);
              });
            },
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // SizedBox(height: 20),
              Card(
                elevation: 8,
                child: Container(
                    width: double.infinity,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.black12,
                        backgroundImage:
                            NetworkImage(loginProv.profileModel.urlimage),
                      ),
                      subtitle: TextField(
                        controller: askProv.askCtrl,
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintMaxLines: 5,
                          alignLabelWithHint: true,
                          hintText: "Tulis pertanyaan di sini",
                          helperMaxLines: 10,
                        ),
                      ),
                    )),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
