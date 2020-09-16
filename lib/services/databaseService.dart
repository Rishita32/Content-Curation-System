import 'package:CheerApp/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final Firestore _firestore = Firestore.instance;

  Future<String> createUser(User user) async {
    String retVal = "error";

    try {
      await _firestore.collection("users").document(user.userId).setData({
        'fullName': user.userName.trim(),
        'email': user.userEmail.trim(),
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }
}