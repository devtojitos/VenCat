import 'FinanceModel/project_business_finance_model.dart';
import 'MarketingModel/project_business_marketing_model.dart';
import 'OperationModel/project_business_operation_model.dart';
import 'project_business_basic_info_model.dart';

class ProjectBusinessModel {
  late String projectId, userId;
  final int createdOn;
  final BusinessBasicInfoModel? businessBasicInfoModel;
  final BusinessFinanceModel? businessFinanceModel;
  final BusinessMarketingModel? businessMarketingModel;
  final BusinessOperationModel? businessOperationModel;

  ProjectBusinessModel({
    required this.projectId,
    required this.userId,
    required this.createdOn,
    this.businessBasicInfoModel,
    this.businessFinanceModel,
    this.businessMarketingModel,
    this.businessOperationModel,
  });

  factory ProjectBusinessModel.fromJson(Map<String, dynamic> json) {
    return ProjectBusinessModel(
      projectId: json["projectId"],
      userId: json["userId"],
      createdOn: json["createdOn"],
      businessBasicInfoModel: BusinessBasicInfoModel.fromJson(json["businessBasicInfoModel"]),
      businessFinanceModel: json["businessFinanceModel"] != null
          ? BusinessFinanceModel.fromJson(json["businessFinanceModel"])
          : BusinessFinanceModel(
          detailedFinancialProjectionsPdf: '',
          breakEvenAnalysisPdf: '',
          initialInvestment: 1,
          operatingCost: 1,
          furnishCost: 1,
          equipmentCost: 1,
          operatingMaterialCost: 1,
          businessModel: '1',
          revenueStream: '',
          operatingCostModel: ''
      ),
      businessMarketingModel: json["businessMarketingModel"] != null
          ? BusinessMarketingModel.fromJson(json["businessMarketingModel"])
          : BusinessMarketingModel(
          competitorAnalysisPdf: '',
          SWOTAnalysisPdf: '',
          salesChannel: '',
          marketingStrategy: '',
          pricingPdf: '',
          targetMarketAge: '',
          targetMarketGender: '',
          targetMarketHobbies: ''
      ),
      businessOperationModel: json["businessOperationModel"] != null
          ? BusinessOperationModel.fromJson(json["businessOperationModel"])
          : BusinessOperationModel(
          numberOfEmployees: 1,
          operationPlanPdf: '',
          jobs: []
      ),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "projectId": projectId,
      "userId": userId,
      "createdOn": createdOn,
      "businessBasicInfoModel": businessBasicInfoModel?.toJson(),
      "businessFinanceModel": businessFinanceModel?.toJson(),
      "businessMarketingModel": businessMarketingModel?.toJson(),
      "businessOperationModel": businessOperationModel?.toJson(),
    };
  }
}
