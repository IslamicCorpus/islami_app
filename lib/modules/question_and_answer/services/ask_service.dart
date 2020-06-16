import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:islami/const/api.dart';

import 'package:islami/modules/question_and_answer/models/answer_model.dart';
import 'package:islami/modules/question_and_answer/models/ask_model.dart';

import 'package:toast/toast.dart';

class AskService extends ChangeNotifier {
  final _api = Api("Q&A");

  File _image;
  String _uploadedFileURL;
  AskModel _askModel;
  List<AskModel> _listAskModel;
  List<AnswerModel> _listAnswerModel;

  final askCtrl = TextEditingController();
  final commentCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  File get image => _image;
  String get uploadedFileURL => _uploadedFileURL;
  AskModel get quotesModel => _askModel;
  List<AskModel> get listAskModel => _listAskModel;
  List<AnswerModel> get listAnswerModel => _listAnswerModel;

  //Toast
  void showToast(String msg, BuildContext context,
      {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  Future addDocument(Map<String, dynamic> data) async {
    await _api.addDocument(data);
    return;
  }

  //nambah komentar
  Future addComment(String id, Map<String, dynamic> data) async {
    await _api.addCommentCollection(id, data);
    notifyListeners();
    return;
  }

  Future<List<AskModel>> getDataCollection() async {
    var res = await _api.getDataCollection();
    _listAskModel =
        res.documents.map((doc) => AskModel.fromFirestore(doc)).toList();
    return _listAskModel;
  }

  Future<List<AnswerModel>> getCommentCollection(String id) async {
    var res = await _api.getCommentById(id);
    _listAnswerModel =
        res.documents.map((doc) => AnswerModel.fromFirestore(doc)).toList();
    return _listAnswerModel;
  }

  //update
  Future updateDocument(String id, Map<String, dynamic> data) async {
    await _api.updateDocument(id, data);
    notifyListeners();
    return;
  }

  // Hapus q&a
  Future removeDocument(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future removeComment(String id, String commentId) async {
    await _api.removeComment(id, commentId);
    return;
  }
}
