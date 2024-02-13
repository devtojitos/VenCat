import 'additional_info_user_model.dart';

class UserModel {
  String userFirstName = "", userLastName = "", userId = "", email = "";
  int dateOfBirth = 0, registrationDate = 0, phoneNumber = 0;
  bool userEmailVerified = false;
  AdditionalInfoUserModel? additionalInfoUserModel;

  UserModel({
    required this.userId,
    required this.userFirstName,
    required this.userLastName,
    required this.dateOfBirth,
    required this.registrationDate,
    required this.phoneNumber,
    required this.email,
    this.userEmailVerified = false,
    this.additionalInfoUserModel,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json["userId"],
      userFirstName: json["userFirstName"],
      userLastName: json["userLastName"],
      dateOfBirth: json["dateOfBirth"],
      registrationDate: json["registrationDate"],
      phoneNumber: json["phoneNumber"],
      email: json["email"],
      userEmailVerified: json["userEmailVerified"] ?? false,
      additionalInfoUserModel: json["additionalInfoUserModel"] != null
          ? AdditionalInfoUserModel.fromJson(json["additionalInfoUserModel"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "userFirstName": userFirstName,
      "userLastName": userLastName,
      "dateOfBirth": dateOfBirth,
      "registrationDate": registrationDate,
      "phoneNumber": phoneNumber,
      "email": email,
      "userEmailVerified": userEmailVerified,
      "additionalInfoUserModel": additionalInfoUserModel?.toJson(),
    };
  }
}
