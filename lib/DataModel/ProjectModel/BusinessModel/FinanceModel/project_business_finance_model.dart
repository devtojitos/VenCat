
class BusinessFinanceModel {
  String detailedFinancialProjectionsPdf = "",
      breakEvenAnalysisPdf = "",
      businessModel = '',
      operatingCostModel = '',
      revenueStream = '';
  int initialInvestment = 0,
      operatingCost = 0,
      furnishCost = 0,
      equipmentCost = 0,
      operatingMaterialCost = 0;

  BusinessFinanceModel({
    required this.detailedFinancialProjectionsPdf,
    required this.breakEvenAnalysisPdf,
    required this.initialInvestment,
    required this.operatingCost,
    required this.furnishCost,
    required this.equipmentCost,
    required this.operatingMaterialCost,
    required this.businessModel,
    required this.revenueStream,
    required this.operatingCostModel,
  });

  factory BusinessFinanceModel.fromJson(Map<String, dynamic> json) {
    return BusinessFinanceModel(
      detailedFinancialProjectionsPdf: json["detailedFinancialProjectionsPdf"],
      breakEvenAnalysisPdf: json["breakEvenAnalysisPdf"],
      initialInvestment: json["initialInvestment"],
      operatingCost: json["operatingCost"],
      furnishCost: json["furnishCost"],
      equipmentCost: json["equipmentCost"],
      operatingMaterialCost: json["operatingMaterialCost"],
      businessModel: json["businessModel"],
      revenueStream: json["revenueStream"],
      operatingCostModel: json["operatingCostModel"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "detailedFinancialProjectionsPdf": detailedFinancialProjectionsPdf,
      "breakEvenAnalysisPdf": breakEvenAnalysisPdf,
      "initialInvestment": initialInvestment,
      "operatingCost": operatingCost,
      "furnishCost": furnishCost,
      "equipmentCost": equipmentCost,
      "operatingMaterialCost": operatingMaterialCost,
      "businessModel": businessModel,
      "revenueStream": revenueStream,
      "operatingCostModel": operatingCostModel,
    };
  }
}