class BusinessMarketingModel {
  String competitorAnalysisPdf = '',
      SWOTAnalysisPdf = '',
      pricingPdf = '',
      targetMarketAge = '',
      targetMarketGender = '',
      targetMarketHobbies = '',
      salesChannel = '',
      marketingStrategy = '';

  BusinessMarketingModel({
    required this.competitorAnalysisPdf,
    required this.SWOTAnalysisPdf,
    required this.salesChannel,
    required this.marketingStrategy,
    required this.pricingPdf,
    required this.targetMarketAge,
    required this.targetMarketGender,
    required this.targetMarketHobbies,
  });

  factory BusinessMarketingModel.fromJson(Map<String, dynamic> json) {
    return BusinessMarketingModel(
      competitorAnalysisPdf: json["competitorAnalysisPdf"],
      SWOTAnalysisPdf: json["SWOTAnalysisPdf"],
      salesChannel: json["salesChannel"],
      marketingStrategy: json["marketingStrategy"],
      pricingPdf: json["pricingPdf"],
      targetMarketAge: json["targetMarketAge"],
      targetMarketGender: json["targetMarketGender"],
      targetMarketHobbies: json["targetMarketHobbies"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "competitorAnalysisPdf": competitorAnalysisPdf,
      "SWOTAnalysisPdf": SWOTAnalysisPdf,
      "salesChannel": salesChannel,
      "marketingStrategy": marketingStrategy,
      "pricingPdf": pricingPdf,
      "targetMarketAge": targetMarketAge,
      "targetMarketGender": targetMarketGender,
      "targetMarketHobbies": targetMarketHobbies,
    };
  }
}
