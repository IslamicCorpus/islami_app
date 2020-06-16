import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:islami/modules/profile/model/profile_model.dart';
import 'package:islami/modules/profile/services/profile_services.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class LoginService extends ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  ProfileModel _profileModel;
  String _errorCode;
  GoogleSignIn _googleSignIn;

  Status get status => _status;
  FirebaseUser get user => _user;
  ProfileModel get profileModel => _profileModel;
  GoogleSignIn get googleSignIn => _googleSignIn;
  String get errorCode => _errorCode;

  LoginService.instance() : _auth = FirebaseAuth.instance {
    // _googleSignIn = GoogleSignIn() {
    _auth.onAuthStateChanged.listen(_onAuthStateChanged);
  }
  // }

  //? Sign in
  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signUp(String email, String password, String nama) async {
    List<String> cekcekemail =
        await _auth.fetchSignInMethodsForEmail(email: email);
    if (cekcekemail != null && cekcekemail.length > 0) {
      print(cekcekemail.toString());
      return false;
    }
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        ProfileService().setDocument(value.user.uid, {
          "nama": nama,
          "email": email,
          "gender": "belum mengisi jenis kelamin",
          "urlImg": "https://image.flaticon.com/icons/png/512/44/44948.png"
        }).then((_) => ProfileService()
            .getDocumentById(value.user.uid)
            .then((value) => _profileModel = value));

        notifyListeners();
      });
      //.catchError((onError) {
      //   print(errorCode);
      //   // _errorCode = onError.toString();
      //   // notifyListeners();
      //   return false;
      // }, test: (bol) => false);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;

      //tiap login/buka app,getdata detail user, lalu disimpan di Accountservice:AccountDetail; dak jadi ak boros mana wkwkw
      // AccountService().getDocumentById(firebaseUser.uid);
      await ProfileService().cekDataUser(firebaseUser.uid, <String, dynamic>{
        "nama": user.displayName,
        "urlImg":
            "https://firebasestorage.googleapis.com/v0/b/byneet-course.appspot.com/o/98987.png?alt=media&token=8e0bef42-c551-4baa-8696-7de6a720bd43"
      }).then((value) async {
        _profileModel = value;
        print('login sukses');
        _status = Status.Authenticated;
      });
    }
    notifyListeners();
  }
}
