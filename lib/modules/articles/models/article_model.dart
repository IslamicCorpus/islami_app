import 'package:cloud_firestore/cloud_firestore.dart';

//nanti tinggal atur model nye jak..
class ArticleModel {
  final String id;
  final String sender;
  final String senderId;
  final String title;
  final String description;
  final String urlimage;
  final String urlimagesender;
  final DateTime created;
  ArticleModel({
    this.urlimage,
    this.id,
    this.sender,
    this.senderId,
    this.title,
    this.description,
    this.urlimagesender,
    this.created,
  });

  factory ArticleModel.fromFirestore(DocumentSnapshot doc) => ArticleModel(
        id: doc.documentID,
        urlimage: doc.data["urlimage"],
        sender: doc.data["sender"],
        senderId: doc.data["senderId"],
        title: doc.data["title"],
        description: doc.data["description"],
        urlimagesender: doc.data["urlimagesender"],
        created: DateTime.fromMillisecondsSinceEpoch(doc.data["created"],
            isUtc: true),
      );

  Map<String, dynamic> toMap() {
    return {};
  }
}
