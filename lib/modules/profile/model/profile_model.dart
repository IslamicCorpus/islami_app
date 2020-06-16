import 'package:cloud_firestore/cloud_firestore.dart';

//nanti tinggal atur model nye jak..
class ProfileModel {
  final String id;
  final String urlimage;
  final String name;
  final String gender;
  ProfileModel({this.urlimage, this.id, this.name, this.gender});

  factory ProfileModel.fromFirestore(DocumentSnapshot doc) => ProfileModel(
      id: doc.documentID,
      urlimage: doc.data["urlImg"],
      name: doc.data["nama"],
      gender: doc.data["gender"]);

  Map<String, dynamic> toMap() {
    return {};
  }
}
