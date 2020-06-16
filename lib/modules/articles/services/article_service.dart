import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:islami/const/api.dart';
import 'package:islami/modules/articles/models/article_model.dart';
import 'package:path/path.dart' as Path;
import 'package:toast/toast.dart';

class ArticleService extends ChangeNotifier {
  final _api = Api("articles");

  File _image;
  String _uploadedFileURL;
  ArticleModel _articleModel;
  List<ArticleModel> _listQuotesModel;

  final titleCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  File get image => _image;
  String get uploadedFileURL => _uploadedFileURL;
  ArticleModel get quotesModel => _articleModel;
  List<ArticleModel> get listQuotesModel => _listQuotesModel;

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

  Future<List<ArticleModel>> getDataCollection() async {
    var res = await _api.getDataCollection();
    _listQuotesModel =
        res.documents.map((doc) => ArticleModel.fromFirestore(doc)).toList();
    return _listQuotesModel;
  }

  //update
  Future updateDocument(String id, Map<String, dynamic> data) async {
    await _api.updateDocument(id, data);
    notifyListeners();
    return;
  }

  Future<void> pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    _image = selected;
    notifyListeners();
    uploadFile();
  }

  // Hapus article
  Future removeDocument(String id) async {
    await _api.removeDocument(id);
    return;
  }

  void clear() {
    _image = null;
    notifyListeners();
  }

  // Pilih gambar
  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      // setState(() {
      _image = image;
      // });
      notifyListeners();
      uploadFile();
    });
  }

  Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('articles/${Path.basename(_image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    storageReference.getDownloadURL().then((fileURL) {
      _uploadedFileURL = fileURL;
      notifyListeners();
    });
  }
}
