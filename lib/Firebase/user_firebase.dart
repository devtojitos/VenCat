import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../DataModel/UserModel/user_model.dart';

class UserService {

  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();


  Future<UserModel> getUserModel(String userId)async {
    var source = await FirebaseDatabase.instance.ref("Projects").child("Drafts").orderByChild(userId).equalTo(userId).once();
    UserModel? userModel;
    userModel = UserModel.fromJson(source.snapshot.value as Map<String,dynamic>);
    return userModel;
  }



  Future<void> addUser(UserModel user) async {
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      final DatabaseReference _userRef = FirebaseDatabase.instance
          .ref()
          .child('users')
          .child(currentUser.uid);
      await _userRef.set(user.toJson());
    } else {
      print("User is not logged in"); // Handle the case where the user is not logged in
    }
  }


  Future<bool> checkIfPhoneExists(String phoneNumber) async {
    try {
      final source = await _databaseReference
          .child('users')
          .orderByChild("phoneNumber")
          .equalTo(phoneNumber)
          .once();
      var results = source.snapshot;
      if (results.value != null) {
        return true;
      }
      return false;
    } catch (error) {
      print('Error checking application: $error');
      return false;
    }
  }



  Future<bool> checkIfEmailExists(String email) async {
    try {
      final source = await _databaseReference
          .child('users')
          .orderByChild("email")
          .equalTo(email)
          .once();
      var results = source.snapshot;
      if (results.value != null) {
        return true;
      }
      return false;
    } catch (error) {
      print('Error checking application: $error');
      return false;
    }
  }


}
