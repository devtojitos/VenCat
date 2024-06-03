class BusinessMarketingModel {
  String
      detailsPdf = '',
      targetMarketAge = '',
      targetMarketGender = '',
      targetMarketHobbies = '',
      salesChannel = '',
      marketingStrategy = '';

  BusinessMarketingModel({
    required this.salesChannel,
    required this.marketingStrategy,
    required this.detailsPdf,
    required this.targetMarketAge,
    required this.targetMarketGender,
    required this.targetMarketHobbies,
  });

  factory BusinessMarketingModel.fromJson(Map<String, dynamic> json) {
    return BusinessMarketingModel(
      salesChannel: json["salesChannel"],
      marketingStrategy: json["marketingStrategy"],
      detailsPdf: json["detailsPdf"],
      targetMarketAge: json["targetMarketAge"],
      targetMarketGender: json["targetMarketGender"],
      targetMarketHobbies: json["targetMarketHobbies"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "salesChannel": salesChannel,
      "marketingStrategy": marketingStrategy,
      "detailsPdf": detailsPdf,
      "targetMarketAge": targetMarketAge,
      "targetMarketGender": targetMarketGender,
      "targetMarketHobbies": targetMarketHobbies,
    };
  }
}
