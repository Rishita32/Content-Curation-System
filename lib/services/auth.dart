import 'package:firebase_auth/firebase_auth.dart';
import 'package:CheerApp/models/authModel.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  AuthModel _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? AuthModel(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<AuthModel> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
