import 'package:flutter/material.dart';
import 'package:islami/const/customColor.dart';
import 'package:islami/modules/articles/services/article_service.dart';
import 'package:islami/modules/sign_in/services/login_service.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class AddArticleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginProv = Provider.of<LoginService>(context);
    final articleProv = Provider.of<ArticleService>(context);
    void showToast(String msg, {int duration, int gravity}) {
      Toast.show(msg, context, duration: duration, gravity: gravity);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: RaisedButton(
              color: Color(primaryColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Text(
                "SELESAI",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                articleProv.addDocument({
                  "sender": loginProv.profileModel.name,
                  "senderId": loginProv.profileModel.id,
                  "title": articleProv.titleCtrl.text,
                  "description": articleProv.descriptionCtrl.text,
                  "urlimage": articleProv.uploadedFileURL,
                  "urlimagesender": loginProv.profileModel.urlimage,
                  "created": DateTime.now().toUtc().millisecondsSinceEpoch,
                }).then((value) {
                  Navigator.pop(context);
                  articleProv.clear();
                  articleProv.titleCtrl.clear();
                  articleProv.descriptionCtrl.clear();
                  showToast("Artikel berhasil dibuat",
                      duration: Toast.LENGTH_LONG);
                }).catchError((onError) {
                  print("Error");
                });
              },
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              articleProv.image != null
                  ? GestureDetector(
                      onTap: () {
                        articleProv.chooseFile();
                      },
                      child: Image.file(articleProv.image, height: 400.0),
                    )
                  : GestureDetector(
                      onTap: () {
                        articleProv.chooseFile();
                      },
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black12),
                          color: Colors.black12,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black12,
                    backgroundImage:
                        NetworkImage(loginProv.profileModel.urlimage),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: articleProv.titleCtrl,
                          maxLength: 50,
                          maxLines: 2,
                          decoration: InputDecoration(
                              hintText: "Tulis judul untuk artikel ini..."),
                        ),
                        TextField(
                          controller: articleProv.descriptionCtrl,
                          // maxLength: 20,
                          maxLines: 20,
                          decoration:
                              InputDecoration(hintText: "Tulis artikel..."),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
