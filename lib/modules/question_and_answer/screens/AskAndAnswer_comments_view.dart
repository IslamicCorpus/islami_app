import 'package:flutter/material.dart';
import 'package:islami/modules/question_and_answer/models/ask_model.dart';
import 'package:islami/modules/question_and_answer/services/ask_service.dart';
import 'package:islami/modules/sign_in/services/login_service.dart';
import 'package:provider/provider.dart';
import 'package:islami/modules/question_and_answer/widgets/comment_card.dart';

class AskAndAnswerCommentsView extends StatelessWidget {
  final AskModel ask;
  AskAndAnswerCommentsView({this.ask});
  @override
  Widget build(BuildContext context) {
    final askProv = Provider.of<AskService>(context);
    final loginProv = Provider.of<LoginService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Komentar"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 8,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black12,
                          backgroundImage: NetworkImage(ask.urlimagesender),
                        ),
                        title: Text(
                          ask.sender,
                          style: TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          ask.question,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Komentar",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 25),
                    FutureBuilder(
                        future: askProv.getCommentCollection(ask.id),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Center(child: CircularProgressIndicator());
                          }

                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            scrollDirection: Axis.vertical,
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var answer = snapshot.data[index];
                              return CommentCard(
                                answer: answer,
                                ask: ask,
                              );
                            },
                          );
                        })
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: askProv.commentCtrl,
                        decoration:
                            InputDecoration(hintText: "Tulis komentar..."),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        askProv.addComment(ask.id, {
                          "comment": askProv.commentCtrl.text,
                          "created":
                              DateTime.now().toUtc().millisecondsSinceEpoch,
                          "name": loginProv.profileModel.name,
                          "nameId": loginProv.profileModel.id,
                          "urlimage": loginProv.profileModel.urlimage,
                        }).then((value) {
                          // Navigator.pop(context);
                          askProv.showToast("Komentar ditambah", context);
                          askProv.commentCtrl.clear();
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
