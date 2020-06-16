import 'package:cloud_firestore/cloud_firestore.dart';

//nanti tinggal atur model nye jak..
class QuotesModel {
  final String id;
  final String sender;
  final String senderId;
  final String caption;
  final String urlimage;
  final String urlimagesender;
  QuotesModel({
    this.urlimage,
    this.id,
    this.sender,
    this.caption,
    this.urlimagesender,
    this.senderId,
  });

  factory QuotesModel.fromFirestore(DocumentSnapshot doc) => QuotesModel(
        id: doc.documentID,
        urlimage: doc.data["urlimage"],
        sender: doc.data["sender"],
        caption: doc.data["caption"],
        urlimagesender: doc.data["urlimagesender"],
        senderId: doc.data["senderId"],
      );

  Map<String, dynamic> toMap() {
    return {};
  }
}
