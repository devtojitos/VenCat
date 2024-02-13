
import 'package:vencat/DataModel/ProjectModel/BusinessModel/MarketingModel/project_business_marketing_target_age_model.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/MarketingModel/project_business_marketing_target_gender_model.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/MarketingModel/project_business_marketing_target_hobbies_model.dart';

class BusinessMarketingTargetMarketModel{
  BusinessMarketingTargetAgeModel businessMarketingTargetAgeModel;
  BusinessMarketingTargetGenderModel businessMarketingTargetGenderModel;
  BusinessMarketingTargetHobbiesModel businessMarketingTargetHobbiesModel;

  BusinessMarketingTargetMarketModel(
      this.businessMarketingTargetAgeModel,
      this.businessMarketingTargetGenderModel,
      this.businessMarketingTargetHobbiesModel);
}

