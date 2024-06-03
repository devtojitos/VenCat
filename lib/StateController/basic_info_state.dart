import 'package:get/get.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/FinanceModel/project_business_finance_model.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/MarketingModel/project_business_marketing_model.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/BasicInfoModel/project_business_basic_info_model.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/SettingModel/project_business_settings_model.dart';
import 'package:vencat/DataModel/ProjectModel/project_model.dart';

import '../DataModel/ProjectModel/BusinessModel/project_business_model.dart';

class ProjectSelectedStateController extends GetxController {

  var selectedProjectModel = ProjectModel(
      projectId: "",
      userId: "userId",
      dateCreated: 0,
      projectBusinessModel: ProjectBusinessModel(), projectMembers: [], projectJoinRequest: [],
  )
      .obs;


  var selectedBusinessModel = ProjectBusinessModel(
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
              salesChannel: '',
              marketingStrategy: '',
              detailsPdf: '',
              targetMarketAge: '',
              targetMarketGender: '',
              targetMarketHobbies: ''),
          businessFinanceModel: BusinessFinanceModel(
            detailedFinancialProjectionsPdf: '',
            initialInvestment: 0,
            operatingCost: 0,
            furnishCost: 0,
            equipmentCost: 0,
            operatingMaterialCost: 0,
          ),
          businessSettingsModel: BusinessSettingsModel(
              investorsType: false,
              projectType: false,
              checkSubscribersOpen: false,
              checkSubscribersClose: false,
              checkShowCase: false,
              checkmessaging: false))
      .obs;
}
