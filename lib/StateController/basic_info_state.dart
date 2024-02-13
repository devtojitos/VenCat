import 'package:get/get.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/FinanceModel/project_business_finance_model.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/MarketingModel/project_business_marketing_model.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/project_business_basic_info_model.dart';

import '../DataModel/ProjectModel/BusinessModel/project_business_model.dart';

class ProjectSelectedStateController extends GetxController {
  var selectedBusinessModel = ProjectBusinessModel(
    projectId: "",
    userId: "userId",
    createdOn: 0,
    businessBasicInfoModel: BusinessBasicInfoModel(
      partnersNumber: 1,
      businessCapital: 1,
      businessDescription: "",
      businessField: "",
      businessLocationArea: "",
      businessLocationCity: "",
      businessTitle: "",
      businessType: "",
    ),
    businessMarketingModel: BusinessMarketingModel(
        competitorAnalysisPdf: '',
        SWOTAnalysisPdf: '',
        salesChannel: '',
        marketingStrategy: '',
        pricingPdf: '',
        targetMarketAge: '',
        targetMarketGender: '',
        targetMarketHobbies: ''),
    businessFinanceModel: BusinessFinanceModel(
        detailedFinancialProjectionsPdf: '',
        breakEvenAnalysisPdf: '',
        initialInvestment: 0,
        operatingCost: 1,
        furnishCost: 0,
        equipmentCost: 1,
        operatingMaterialCost: 0,
        businessModel: '',
        revenueStream: '',
        operatingCostModel: ''),
  ).obs;
}
