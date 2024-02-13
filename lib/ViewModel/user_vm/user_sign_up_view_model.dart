



import '../../DataModel/UserModel/user_model.dart';

abstract class UserCreateAccountViewModel {

  Future<void> submitUser(UserModel userModel);
}
