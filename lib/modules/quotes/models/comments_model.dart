import 'package:cloud_firestore/cloud_firestore.dart';

//nanti tinggal atur model nye jak..
class CommentModel {
  final String id;
  final String name;
  final String nameId;
  final String comment;
  final String urlimage;
  CommentModel({this.urlimage, this.id, this.name, this.comment, this.nameId});

  factory CommentModel.fromFirestore(DocumentSnapshot doc) => CommentModel(
        id: doc.documentID,
        urlimage: doc.data["urlimage"],
        name: doc.data["name"],
        comment: doc.data["comment"],
        nameId: doc.data["nameId"],
      );

  Map<String, dynamic> toMap() {
    return {};
  }
}
