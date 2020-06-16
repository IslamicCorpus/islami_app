import 'package:cloud_firestore/cloud_firestore.dart';

//nanti tinggal atur model nye jak..
class AnswerModel {
  final String id;
  final String name;
  final String nameId;

  final String comment;
  final String urlimage;
  final DateTime created;
  AnswerModel({
    this.id,
    this.name,
    this.nameId,
    this.comment,
    this.urlimage,
    this.created,
  });

  factory AnswerModel.fromFirestore(DocumentSnapshot doc) => AnswerModel(
        id: doc.documentID,
        name: doc.data["name"],
        nameId: doc.data["nameId"],
        comment: doc.data["comment"],
        urlimage: doc.data["urlimage"],
        created: DateTime.fromMillisecondsSinceEpoch(doc.data["created"],
            isUtc: true),
      );

  Map<String, dynamic> toMap() {
    return {};
  }
}
