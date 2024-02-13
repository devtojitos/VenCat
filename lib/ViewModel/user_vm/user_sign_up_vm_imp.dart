


import 'package:vencat/ViewModel/user_vm/user_sign_up_view_model.dart';

import '../../DataModel/UserModel/user_model.dart';
import '../../Firebase/user_firebase.dart';

class UserCreateAccountViewModelImp extends UserCreateAccountViewModel {
  UserService userService = UserService();
  @override

  Future<void> submitUser(UserModel userModel) {
    return userService.addUser(userModel);
  }


}