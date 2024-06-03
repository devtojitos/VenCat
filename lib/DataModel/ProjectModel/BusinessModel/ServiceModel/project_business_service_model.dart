class BusinessServiceModel {
  final bool mobileApp ,
      websiteDevelopment,
      softwareDevelopment,
      personalAccountant,
      lawyer,
      marketResearch,
      marketing;

  BusinessServiceModel({
     required this.mobileApp,
    required this.websiteDevelopment,
    required this.softwareDevelopment,
    required this.personalAccountant,
    required this.lawyer,
    required this.marketResearch,
    required this.marketing,
  });

  factory BusinessServiceModel.fromJson(Map<String, dynamic> json) {
    return BusinessServiceModel(
      mobileApp: json['mobileApp'] ,
      websiteDevelopment: json['websiteDevelopment'],
      softwareDevelopment: json['softwareDevelopment'],
      personalAccountant: json['personalAccountant'] ,
      lawyer: json['lawyer'] ,
      marketResearch: json['marketResearch'],
      marketing: json['marketing'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mobileApp': mobileApp,
      'websiteDevelopment': websiteDevelopment,
      'softwareDevelopment': softwareDevelopment,
      'personalAccountant': personalAccountant,
      'lawyer': lawyer,
      'marketResearch': marketResearch,
      'marketing': marketing,
    };
  }
}
