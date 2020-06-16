import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:islami/modules/question_and_answer/models/answer_model.dart';
import 'package:islami/modules/question_and_answer/models/ask_model.dart';
import 'package:islami/modules/question_and_answer/services/ask_service.dart';
import 'package:provider/provider.dart';

class CommentCard extends StatelessWidget {
  final AnswerModel answer;
  final AskModel ask;
  CommentCard({this.answer, this.ask});

  @override
  Widget build(BuildContext context) {
    final askProv = Provider.of<AskService>(context);
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.black12,
          backgroundImage: NetworkImage(
            answer.urlimage,
          ),
        ),
        title: Text(
          answer.name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              answer.comment,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            Text(
              timeago.format(answer.created, allowFromNow: true),
              style: TextStyle(
                fontSize: 12,
                color: Colors.black45,
              ),
            ),
          ],
        ),
        trailing: ask.senderId == answer.nameId
            ? IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  askProv.removeComment(ask.id, answer.id).then((value) =>
                      askProv.showToast("Berhasil dihapus", context));
                },
              )
            : null,
      ),
    );
  }
}
