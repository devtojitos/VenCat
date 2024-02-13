import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../DataModel/UserModel/user_model.dart';

class UserService {
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
}
