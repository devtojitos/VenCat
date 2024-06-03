import 'package:get/get.dart';
import 'package:vencat/DataModel/UserModel/user_model.dart';

class UserStateController extends GetxController {


  var userInitState = UserModel(userId: "userId",
    userDisplayName: "userFirstName",
      dateOfBirth: 125412512,
      registrationDate: 125412512,
      phoneNumber: "12512512",
   ).obs;
}