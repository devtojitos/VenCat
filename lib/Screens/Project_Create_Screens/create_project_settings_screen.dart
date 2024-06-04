import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/SettingModel/project_business_settings_model.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/project_business_model.dart';
import 'package:vencat/DataModel/ProjectModel/project_model.dart';
import 'package:vencat/Firebase/project_details_firebase.dart';
import 'package:vencat/Screens/Project_Create_Screens/create_project_overview_screen.dart';
import 'package:vencat/Screens/home_screen.dart';
import 'package:vencat/Screens/your_projects_screen.dart';
import 'package:vencat/StateController/basic_info_state.dart';

class CreateProjectSettingsScreen extends StatefulWidget {
  const CreateProjectSettingsScreen(
      {super.key, required this.onSave, required this.onBack});

  final VoidCallback onSave;
  final VoidCallback onBack;

  @override
  State<CreateProjectSettingsScreen> createState() =>
      _CreateProjectSettingsScreenState();



}

class _CreateProjectSettingsScreenState
    extends State<CreateProjectSettingsScreen> {

  static String generateProjectId() {
    final random = Random();

    final currentDateTime = DateTime.now();
    final formattedDate =
        "${currentDateTime.year}${currentDateTime.month.toString().padLeft(2, '0')}${currentDateTime.day.toString().padLeft(2, '0')}";
    final formattedTime =
        "${currentDateTime.hour.toString().padLeft(2, '0')}${currentDateTime.minute.toString().padLeft(2, '0')}${currentDateTime.second.toString().padLeft(2, '0')}";

    final randomNumbers =
    List.generate(10, (index) => random.nextInt(10)).join();

    final ProjectId = '$formattedDate$formattedTime$randomNumbers';
    return ProjectId;
  }
  final projectId = generateProjectId();

  final ProjectService projectService = ProjectService();
  bool? checkShowCase = false;
  bool? checkmessaging = false;
  bool? checkSubscribersOpen = false;
  bool? checkSubscribersClose = false;
  bool? partnersInvest = false;
  bool? partnersPartner = false;
  bool? isChecked = false;
  bool? isPartnersChecked = false;
  bool? isInvestorsChecked = false;

  bool? isCardChoice = true;
  ProjectSelectedStateController _projectSelectedStateController = Get.find();

  bool? isDirectCard = true;
  bool? isShowCaseCard = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                tileMode: TileMode.mirror,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.yellow
                ], // Adjust colors as needed
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Looking For: "),
                      Row(
                        children: [
                          Icon(Icons.people),
                          Text("Partners"),
                          Checkbox(
                              value: isPartnersChecked,
                              onChanged: (newBool) {
                                setState(() {
                                  isPartnersChecked = newBool;
                                });
                              }),
                          Icon(Icons.money_outlined),
                          Text("Investors"),
                          Checkbox(
                              value: isInvestorsChecked,
                              onChanged: (newBool) {
                                setState(() {
                                  isInvestorsChecked = newBool;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Communication options"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isDirectCard = true;
                            isShowCaseCard = false;
                          });
                        },
                        child: Card(
                          elevation: isDirectCard == true ? 10 :0,
                          child: Container(
                            decoration: BoxDecoration(border: Border.all(color: isDirectCard == true ? Colors.green :Colors.transparent)),
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.message,
                                  size: 25,
                                ),
                                const Text("Direct messaging"),
                                SizedBox(
                                  height: 3,
                                ),
                                const Text(
                                    "Users are allowed to request to join the project"),
                                const Text(
                                    "and if accepted the user can participate in a chat room"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {

                            isDirectCard = false;
                            isShowCaseCard = true;
                          });
                        },
                        child: Card(
                          elevation: isShowCaseCard == true ? 10 :0,


                          child: Container(
                            decoration: BoxDecoration(border: Border.all(color: isShowCaseCard == true ? Colors.green :Colors.transparent)),
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.present_to_all,
                                  size: 25,
                                ),
                                const Text("ShowCase"),
                                SizedBox(
                                  height: 3,
                                ),
                                const Text(
                                    "Users are only allowed to subscribe or request to subscribe the project"),
                                const Text(
                                    "a showcase for the project is demonstrated for subscribed user when you decide"),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      BusinessSettingsModel businessSettingsModel =
                          BusinessSettingsModel(
                              investorsType: isInvestorsChecked!,
                              partnersInvest: isInvestorsChecked,
                              partnersPartner: isPartnersChecked,
                              projectType: checkSubscribersOpen!,
                              checkSubscribersOpen: checkSubscribersOpen,
                              checkSubscribersClose: checkSubscribersClose,
                              checkShowCase: isShowCaseCard,
                              checkmessaging: isDirectCard);

                      _projectSelectedStateController.selectedBusinessModel
                          .value.businessSettingsModel = businessSettingsModel;

                      ProjectBusinessModel stateProjectModel = _projectSelectedStateController.selectedBusinessModel.value;

                      ProjectModel projectModel = ProjectModel(
                          projectBusinessModel: stateProjectModel,
                          projectId: projectId,
                          userId: FirebaseAuth.instance.currentUser!.uid,
                          dateCreated: DateTime.now().microsecondsSinceEpoch,
                          projectMembers: [],
                          projectJoinRequest: []);

                     await projectService.writeProjectModel(projectModel,projectId);
                     Get.off(()=>HomeScreen());

                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
