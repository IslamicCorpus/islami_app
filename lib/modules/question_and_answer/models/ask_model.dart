import 'package:cloud_firestore/cloud_firestore.dart';

//nanti tinggal atur model nye jak..
class AskModel {
  final String id;
  final String sender;

  final String senderId;
  final String question;
  final String urlimagesender;
  final DateTime created;
  AskModel({
    this.id,
    this.sender,
    this.senderId,
    this.question,
    this.urlimagesender,
    this.created,
  });

  factory AskModel.fromFirestore(DocumentSnapshot doc) => AskModel(
        id: doc.documentID,
        sender: doc.data["sender"],
        senderId: doc.data["senderId"],
        question: doc.data["question"],
        urlimagesender: doc.data["urlimagesender"],
        created: DateTime.fromMillisecondsSinceEpoch(doc.data["created"],
            isUtc: true),
      );

  Map<String, dynamic> toMap() {
    return {};
  }
}
