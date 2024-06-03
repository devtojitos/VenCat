import '../SettingsModel/project_business_settings_model.dart';
import 'FinanceModel/project_business_finance_model.dart';
import 'MarketingModel/project_business_marketing_model.dart';
import 'ServiceModel/project_business_service_model.dart';
import 'SettingModel/project_business_settings_model.dart';
import 'BasicInfoModel/project_business_basic_info_model.dart';

class ProjectBusinessModel {
  final BusinessBasicInfoModel? businessBasicInfoModel;
  late BusinessFinanceModel? businessFinanceModel;
  late BusinessMarketingModel? businessMarketingModel;
  late BusinessSettingsModel? businessSettingsModel;
  late List<String> projectMembersJoined=[];
  late List<String> projectMembersRequests=[];

  ProjectBusinessModel({
    this.businessBasicInfoModel,
    this.businessFinanceModel,
    this.businessMarketingModel,
    this.businessSettingsModel,
  });

  factory ProjectBusinessModel.fromJson(Map<String, dynamic> json) {
    return ProjectBusinessModel(
      businessBasicInfoModel:
          BusinessBasicInfoModel.fromJson(json["businessBasicInfoModel"]),
      businessFinanceModel: json["businessFinanceModel"] != null
          ? BusinessFinanceModel.fromJson(json["businessFinanceModel"])
          : BusinessFinanceModel(
              detailedFinancialProjectionsPdf: '',
              initialInvestment: 0,
              operatingCost: 0,
              furnishCost: 0,
              equipmentCost: 0,
              operatingMaterialCost: 0,
            ),
      businessMarketingModel: json["businessMarketingModel"] != null
          ? BusinessMarketingModel.fromJson(json["businessMarketingModel"])
          : BusinessMarketingModel(
              salesChannel: '',
              marketingStrategy: '',
              detailsPdf: '',
              targetMarketAge: '',
              targetMarketGender: '',
              targetMarketHobbies: ''),
      businessSettingsModel: json["businessSettingsModel"] != null
          ? BusinessSettingsModel.fromJson(json["businessSettingsModel"])
          : BusinessSettingsModel(
              investorsType: false,
              projectType: false,
              checkmessaging: false,
              checkShowCase: false,
              checkSubscribersClose: false,
              checkSubscribersOpen: false),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "businessBasicInfoModel": businessBasicInfoModel?.toJson(),
      "businessFinanceModel": businessFinanceModel?.toJson(),
      "businessMarketingModel": businessMarketingModel?.toJson(),
      "businessSettingsModel": businessSettingsModel?.toJson(),
    };
  }
}
