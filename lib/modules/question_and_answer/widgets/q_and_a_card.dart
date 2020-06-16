import 'package:flutter/material.dart';
import 'package:islami/modules/question_and_answer/models/ask_model.dart';
import 'package:islami/modules/question_and_answer/screens/AskAndAnswer_comments_view.dart';
import 'package:islami/modules/question_and_answer/services/ask_service.dart';
import 'package:islami/modules/sign_in/services/login_service.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class QAndACard extends StatelessWidget {
  final AskModel ask;
  QAndACard({this.ask});

  @override
  Widget build(BuildContext context) {
    final loginProv = Provider.of<LoginService>(context);
    final askProv = Provider.of<AskService>(context);

    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.black12,
                backgroundImage: NetworkImage(
                  ask.urlimagesender,
                ),
              ),
              title: Text(ask.sender),
              subtitle: Text(timeago.format(ask.created)),
              trailing: ask.senderId == loginProv.profileModel.id
                  ? IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: ListTile(
                                onTap: () {
                                  askProv.removeDocument(ask.id).then((value) {
                                    Navigator.pop(context);
                                    askProv.showToast(
                                        "Pertanyaan berhasil dihapus", context);
                                  });
                                },
                                leading: Icon(Icons.delete),
                                title: Text("Hapus"),
                              ),
                            );
                          },
                        );
                      },
                    )
                  : null,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
              child: Text(
                ask.question,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.comment),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AskAndAnswerCommentsView(ask: ask),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
