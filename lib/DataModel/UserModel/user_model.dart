import 'additional_info_user_model.dart';

class UserModel {
  String userDisplayName = "" ,phoneNumber = "",userId = "";
  int dateOfBirth = 0, registrationDate = 0;
  bool userEmailVerified = false;
  AdditionalInfoUserModel? additionalInfoUserModel;

  UserModel({
    required this.userId,
    required this.userDisplayName,
    required this.dateOfBirth,
    required this.registrationDate,
    required this.phoneNumber,
    this.userEmailVerified = false,
    this.additionalInfoUserModel,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json["userId"],
      userDisplayName: json["userDisplayName"],
      dateOfBirth: json["dateOfBirth"],
      registrationDate: json["registrationDate"],
      phoneNumber: json["phoneNumber"],
      userEmailVerified: json["userEmailVerified"] ?? false,
      additionalInfoUserModel: json["additionalInfoUserModel"] != null
          ? AdditionalInfoUserModel.fromJson(json["additionalInfoUserModel"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "userDisplayName": userDisplayName,
      "dateOfBirth": dateOfBirth,
      "registrationDate": registrationDate,
      "phoneNumber": phoneNumber,
      "userEmailVerified": userEmailVerified,
      "additionalInfoUserModel": additionalInfoUserModel?.toJson(),
    };
  }
}
