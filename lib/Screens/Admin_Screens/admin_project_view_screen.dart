import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vencat/Firebase/project_details_firebase.dart';
import 'package:vencat/StateController/basic_info_state.dart';

import '../../DataModel/ProjectModel/BusinessModel/project_business_model.dart';

class AdminProjectViewScreen extends StatelessWidget {
  const AdminProjectViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectSelectedStateController projectSelectedStateController = Get.find();
    ProjectService projectService = ProjectService();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessMarketingModel?.salesChannel.toString()}"),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessMarketingModel?.marketingStrategy.toString()}"),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessMarketingModel?.targetMarketHobbies.toString()}"),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessMarketingModel?.targetMarketGender.toString()}"),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessMarketingModel?.targetMarketAge.toString()}"),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessFinanceModel?.initialInvestment.toString()}"),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessFinanceModel?.operatingMaterialCost.toString()}"),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessFinanceModel?.operatingCost.toString()}"),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessFinanceModel?.furnishCost.toString()}"),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessFinanceModel?.equipmentCost.toString()}"),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessSettingsModel?.checkShowCase}"),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessSettingsModel?.checkSubscribersClose}"),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessSettingsModel?.checkSubscribersOpen}"),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessSettingsModel?.checkmessaging}"),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessSettingsModel?.partnersInvest}"),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessSettingsModel?.partnersPartner}"),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessSettingsModel?.investorsType}"),
          Text(
              "${projectSelectedStateController.selectedBusinessModel.value.businessSettingsModel?.projectType}"),
          Row(
            children: [
              TextButton(
                  onPressed: () async {
                    ProjectBusinessModel projectBusinessModel =
                        ProjectBusinessModel(
                            businessBasicInfoModel:
                                projectSelectedStateController
                                    .selectedBusinessModel
                                    .value
                                    .businessBasicInfoModel,
                            businessMarketingModel:
                                projectSelectedStateController
                                    .selectedBusinessModel
                                    .value
                                    .businessMarketingModel,
                            businessFinanceModel: projectSelectedStateController
                                .selectedBusinessModel
                                .value
                                .businessFinanceModel,
                            businessSettingsModel:
                                projectSelectedStateController
                                    .selectedBusinessModel
                                    .value
                                    .businessSettingsModel);

                  },
                  child: Text("Publish")),
              TextButton(onPressed: () {}, child: Text("Reject"))
            ],
          )
        ],
      ),
    );
  }
}
