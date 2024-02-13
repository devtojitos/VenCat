class AdditionalInfoUserModel {
  String education = "",
      classYear = "",
      university = "",
      major = "",
      city = "",
      town ="",
      occupation="",
      userNatId = "",
      userProfileImage = "";
  bool userIdVerified=false;

  AdditionalInfoUserModel({
    required this.city,
    required this.classYear,
    required this.education,
    required this.major,
    required this.town,
    required this.university,
    this.occupation = "",
    this.userNatId = "",
    this.userProfileImage = "",
    this.userIdVerified = false,
  });

  factory AdditionalInfoUserModel.fromJson(Map<String, dynamic> json) {
    return AdditionalInfoUserModel(
      city: json["city"],
      classYear: json["classYear"],
      education: json["education"],
      major: json["major"],
      town: json["town"],
      university: json["university"],
      occupation: json["occupation"] ?? "",
      userNatId: json["userNatId"] ?? "",
      userProfileImage: json["userProfileImage"] ?? "",
      userIdVerified: json["userIdVerified"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "city": city,
      "classYear": classYear,
      "education": education,
      "major": major,
      "town": town,
      "university": university,
      "occupation": occupation,
      "userNatId": userNatId,
      "userProfileImage": userProfileImage,
      "userIdVerified": userIdVerified,
    };
  }
}
