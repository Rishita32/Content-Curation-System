import 'package:CheerApp/services/databaseService.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {
  String userId;
  String userName;
  String userEmail;

  User({
    this.userId,
    this.userName,
    this.userEmail,
  });

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(userId: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //login with email and passwd
  Future logInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //register with email and passwd
  Future registerWithEmailAndPassword(
      String email, String password, String fullName) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // create a new document for the user with the uid
      User _user = User(
        userId: result.user.uid,
        userEmail: result.user.email,
        userName: fullName.trim(),
      );
      await DatabaseService().createUser(_user);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
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
