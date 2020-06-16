import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:islami/const/api.dart';
import 'package:islami/modules/profile/model/profile_model.dart';
import 'package:path/path.dart' as Path;
import 'package:toast/toast.dart';

class ProfileService with ChangeNotifier {
  final _api = Api('users');
  //langsung masukkan path collection nye. jadi ini ngambik collection('user')

  File _image;
  String _uploadedFileURL;

  List<ProfileModel> _listAccount;
  ProfileModel _accountDetail;

  List<ProfileModel> get listAccount => _listAccount;
  ProfileModel get accountDetail => _accountDetail;
  File get image => _image;
  String get uploadedFileURL => _uploadedFileURL;

  void showToast(String msg, BuildContext context,
      {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  //nambah documnt
  Future addDocument(Map data) async {
    await _api.addDocument(data);
    return;
  }

  Future setDocument(String id, Map<String, dynamic> data) async {
    await _api.setDocument(id, data);
    return;
  }

  Future<List<ProfileModel>> getDataCollection() async {
    var res = await _api.getDataCollection();
    _listAccount =
        res.documents.map((doc) => ProfileModel.fromFirestore(doc)).toList();
    return listAccount;
  }

  Future<ProfileModel> getDocumentById(String id) async {
    var doc = await _api.getDocumentById(id);
    if (!doc.exists) return null;
    _accountDetail = ProfileModel.fromFirestore(doc);
    return accountDetail;
  }

  Future removeDocument(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateDocument(String id, Map<String, dynamic> data) async {
    await _api.updateDocument(id, data);
    notifyListeners();
    return;
  }

  //cek data user dengan uid, mun dak ade, buat data baru, mun ade= return datanye.
  Future<ProfileModel> cekDataUser(String id, Map data) async {
    var cek = await getDocumentById(id);
    if (cek == null) {
      var setNewUserThenData =
          await setDocument(id, data).then((value) => getDocumentById(id));
      return setNewUserThenData;
    } else {
      return cek;
    }
  }

  // Pilih gambar
  Future chooseFile(String id) async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      // setState(() {
      _image = image;
      // });
      notifyListeners();
      uploadFile(id);
    });
  }

  Future uploadFile(String id) async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('users/${Path.basename(_image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    storageReference.getDownloadURL().then((fileURL) {
      _uploadedFileURL = fileURL;
      notifyListeners();
      updateDocument(id, {"urlImg": _uploadedFileURL});
    });
  }
}
