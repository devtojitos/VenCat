import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../DataModel/ProjectModel/BusinessModel/project_business_model.dart';
import '../../Firebase/project_details_firebase.dart';
import '../../StateController/basic_info_state.dart';
import 'create_project_basic_info_screen.dart';
import 'create_project_finance_screen.dart';
import 'create_project_marketing_screen.dart';
import 'create_project_service_screen.dart';
import 'create_project_settings_screen.dart';

class CreateProjectOverviewScreen extends StatefulWidget {
  CreateProjectOverviewScreen({super.key});

  @override
  State<CreateProjectOverviewScreen> createState() =>
      _CreateProjectOverviewScreenState();
}

class _CreateProjectOverviewScreenState
    extends State<CreateProjectOverviewScreen> {
  final ProjectService projectServices = ProjectService();
  String userId = FirebaseAuth.instance.currentUser!.uid;
  ProjectSelectedStateController projectSelectedStateController =
      Get.put(ProjectSelectedStateController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isUserVerified = true;

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
            FutureBuilder(
                future: projectServices.getProjectBusinessModelByUserId(userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (snapshot.hasData) {
                    isUserVerified = false;
                    var projects = snapshot.data;
                    projectSelectedStateController.selectedBusinessModel.value =
                        projects!;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 80,
                            child: Text("datafound"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 250,
                              width: double.infinity,
                              child: ListView(
                                physics: isUserVerified
                                    ? NeverScrollableScrollPhysics()
                                    : AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => CreateProjectInitScreen(onSave: () {  },),
                                      );
                                    },
                                    child: Card(
                                      color: Colors.redAccent.shade400,
                                      elevation: 4,
                                      child: Container(
                                        width: 150,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 30,
                                              ),
                                              FaIcon(FontAwesomeIcons.file),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text("Basic Information"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => CreateProjectMarketingScreen(onSave: () {  }, onBack: () {  },),
                                      );
                                    },
                                    child: Card(
                                      elevation: 5,
                                      color: Colors.green.shade400,
                                      child: Container(
                                        width: 150,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 30,
                                              ),
                                              FaIcon(FontAwesomeIcons.shop),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text("Market and Marketing"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => CreateProjectFinanceScreen(onSave: () {  }, onBack: () {  },),
                                      );
                                    },
                                    child: Card(
                                      elevation: 5,
                                      color: Colors.blue.shade400,
                                      child: Container(
                                        width: 150,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 30,
                                              ),
                                              FaIcon(FontAwesomeIcons.database),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text("Finance"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          () => CreateProjectSettingsScreen(onSave: () {  }, onBack: () {  },),
                                        );
                                      },
                                      child: Card(
                                        elevation: 5,
                                        color: Colors.deepOrange,
                                        child: Container(
                                          width: 150,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                FaIcon(FontAwesomeIcons.gear),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Text("Settings"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.yellow.shade700),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Business basic information: "),
                                  Text(
                                      "Provide data relevent to the questions in the form inside: "),
                                  Text("Comments:")
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.yellow.shade700),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("status: "),
                                  Text("verification: "),
                                  Text("Comments:")
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: TextButton(
                              style: ButtonStyle(),
                              onPressed: () async{


                                ProjectBusinessModel projectBusinessModel = ProjectBusinessModel(

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
                                    businessFinanceModel:
                                    projectSelectedStateController
                                        .selectedBusinessModel
                                        .value
                                        .businessFinanceModel,
                                    businessSettingsModel:
                                    projectSelectedStateController
                                        .selectedBusinessModel
                                        .value
                                        .businessSettingsModel);




                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    isUserVerified = true;

                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 80,
                            child: Text("Data not found"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 250,
                              width: double.infinity,
                              child: ListView(
                                physics: isUserVerified
                                    ? NeverScrollableScrollPhysics()
                                    : AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => CreateProjectInitScreen(onSave: () {  },),
                                      );
                                    },
                                    child: Card(
                                      color: Colors.redAccent.shade400,
                                      elevation: 4,
                                      child: Container(
                                        width: 150,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 30,
                                              ),
                                              FaIcon(FontAwesomeIcons.file),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text("Basic Information"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => CreateProjectMarketingScreen(onSave: () {  }, onBack: () {  },),
                                      );
                                    },
                                    child: Card(
                                      elevation: 5,
                                      color: Colors.green.shade400,
                                      child: Container(
                                        width: 150,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 30,
                                              ),
                                              FaIcon(FontAwesomeIcons.shop),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text("Market and Marketing"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => CreateProjectFinanceScreen(onSave: () {  }, onBack: () {  },),
                                      );
                                    },
                                    child: Card(
                                      elevation: 5,
                                      color: Colors.blue.shade400,
                                      child: Container(
                                        width: 150,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 30,
                                              ),
                                              FaIcon(FontAwesomeIcons.database),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text("Finance"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          () => CreateProjectServiceScreen(),
                                        );
                                      },
                                      child: Card(
                                        elevation: 5,
                                        color: Colors.brown,
                                        child: Container(
                                          width: 150,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                FaIcon(FontAwesomeIcons
                                                    .personWalking),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Text("Services"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          () => CreateProjectSettingsScreen(onSave: () {  }, onBack: () {  },),
                                        );
                                      },
                                      child: Card(
                                        elevation: 5,
                                        color: Colors.deepOrange,
                                        child: Container(
                                          width: 150,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                FaIcon(FontAwesomeIcons.gear),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Text("Settings"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.yellow.shade700),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Business basic information: "),
                                  Text(
                                      "Provide data relevent to the questions in the form inside: "),
                                  Text("Comments:")
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.yellow.shade700),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("status: "),
                                  Text("verification: "),
                                  Text("Comments:")
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: TextButton(
                              style: ButtonStyle(),
                              onPressed: () async{ },
                              child: Text(
                                "Submit",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(
                    width: 4,
                    color: Colors.white70,
                  ),
                ),
                height: 60,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      Text("Project Overview"),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            border: Border.all(color: Colors.white)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: ClipRect(
                              clipBehavior: Clip.hardEdge,
                              child: CachedNetworkImage(
                                height: 20,
                                imageUrl:
                                    "https://e7.pngegg.com/pngimages/906/448/png-clipart-silhouette-person-person-with-helmut-animals-logo-thumbnail.png",
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            (isUserVerified != false)
                ? Positioned(
                    right: 4,
                    top: 80,
                    child: Container(
                      color: Colors.blue.withOpacity(0.5),
                      width: 220,
                      height: 260,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
