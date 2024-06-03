class BusinessFinanceModel {
  String detailedFinancialProjectionsPdf;
  final int initialInvestment,
      operatingCost,
      furnishCost,
      equipmentCost,
      operatingMaterialCost;

  BusinessFinanceModel({
    required this.detailedFinancialProjectionsPdf,
    required this.initialInvestment,
    required this.operatingCost,
    required this.furnishCost,
    required this.equipmentCost,
    required this.operatingMaterialCost,
  });

  factory BusinessFinanceModel.fromJson(Map<String, dynamic> json) {
    return BusinessFinanceModel(
      detailedFinancialProjectionsPdf: json["detailedFinancialProjectionsPdf"],
      initialInvestment: json["initialInvestment"],
      operatingCost: json["operatingCost"],
      furnishCost: json["furnishCost"],
      equipmentCost: json["equipmentCost"],
      operatingMaterialCost: json["operatingMaterialCost"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "detailedFinancialProjectionsPdf": detailedFinancialProjectionsPdf,
      "initialInvestment": initialInvestment,
      "operatingCost": operatingCost,
      "furnishCost": furnishCost,
      "equipmentCost": equipmentCost,
      "operatingMaterialCost": operatingMaterialCost,
    };
  }
}
