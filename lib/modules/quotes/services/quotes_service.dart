import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:islami/const/api.dart';
import 'package:path/path.dart' as Path;
import 'package:islami/modules/quotes/models/quotes_model.dart';
import 'package:islami/modules/quotes/models/comments_model.dart';
import 'package:toast/toast.dart';

class QuotesService extends ChangeNotifier {
  final _api = Api("quotes");

  File _image;
  String _uploadedFileURL;
  QuotesModel _quotesModel;
  List<QuotesModel> _listQuotesModel;
  List<CommentModel> _listCommentModel;
  // TextEditingController _captionCtrl;
  // TextEditingController _commentCtrl;
  TextEditingController _descriptionCtrl;

  final captionCtrl = TextEditingController();
  final commentCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  File get image => _image;
  String get uploadedFileURL => _uploadedFileURL;
  QuotesModel get quotesModel => _quotesModel;
  List<QuotesModel> get listQuotesModel => _listQuotesModel;
  List<CommentModel> get listCommentModel => _listCommentModel;
  // TextEditingController get captionCtrl => _captionCtrl;
  // TextEditingController get commentCtrl => _commentCtrl;
  TextEditingController get descriptionCtrl => _descriptionCtrl;

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

  Future<List<QuotesModel>> getDataCollection() async {
    var res = await _api.getDataCollection();
    _listQuotesModel =
        res.documents.map((doc) => QuotesModel.fromFirestore(doc)).toList();
    return _listQuotesModel;
  }

  Future<List<CommentModel>> getComments(String id) async {
    var res = await _api.getCommentById(id);
    _listCommentModel =
        res.documents.map((doc) => CommentModel.fromFirestore(doc)).toList();
    return _listCommentModel;
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

  // Hapus quotes
  Future removeDocument(String id) async {
    await _api.removeDocument(id);
    return;
  }

  // Hapus quotes
  Future removeComment(String id, commentId) async {
    await _api.removeComment(id, commentId);
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
        .child('quotes/${Path.basename(_image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    storageReference.getDownloadURL().then((fileURL) {
      _uploadedFileURL = fileURL;
      notifyListeners();
    });
  }
}
