import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/project_business_model.dart';

import '../../Firebase/project_details_firebase.dart';
import '../../StateController/basic_info_state.dart';
import 'create_project_basic_info_screen.dart';
import 'create_project_finance_screen.dart';
import 'create_project_marketing_screen.dart';

class CreateProjectOverviewScreen extends StatefulWidget {
   CreateProjectOverviewScreen({super.key});
   final projectSelectedStateController = Get.put(ProjectSelectedStateController());

  @override
  State<CreateProjectOverviewScreen> createState() =>
      _CreateProjectOverviewScreenState();
}

class _CreateProjectOverviewScreenState
    extends State<CreateProjectOverviewScreen> {


  final ProjectService projectServices = ProjectService();
  String userId = FirebaseAuth.instance.currentUser!.uid;


  @override void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business Overview "),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: projectServices.getProjectBusinessModelByUserId(userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              ProjectBusinessModel? projectBusinessModel =snapshot.data;
              widget.projectSelectedStateController.selectedBusinessModel = projectBusinessModel!.obs;


              if (projectBusinessModel != null) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.yellow.shade700),
                          ),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                        () => CreateProjectInitScreen(),
                                  );
                                },
                                child: Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red, width: 3),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                                child: Text("feee DATa",style: TextStyle(fontSize: 40),),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                        () => CreateProjectMarketingScreen(),
                                  );
                                },
                                child: Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red, width: 3),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                        () => CreateProjectFinanceScreen(),
                                  );
                                },
                                child: Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red, width: 3),
                                  ),
                                ),
                              ),
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
                            border: Border.all(color: Colors.yellow.shade700),
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
                            border: Border.all(color: Colors.yellow.shade700),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("status: ${projectBusinessModel.businessBasicInfoModel?.businessDescription}"),
                              Text("verification: "),
                              Text("Comments:")
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          style: ButtonStyle(),
                          onPressed: () { },
                          child: Text(
                            "Submit",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ]);
              } else {
                return  const Text("no Data found");
              }
            } else {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow.shade700),
                        ),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                      () => CreateProjectInitScreen(),
                                );
                              },
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red, width: 3),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                      () => CreateProjectMarketingScreen(),
                                );
                              },
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red, width: 3),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                              child: Text("NO DATa",style: TextStyle(fontSize: 40),),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                      () => CreateProjectFinanceScreen(),
                                );
                              },
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red, width: 3),
                                ),
                              ),
                            ),
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
                          border: Border.all(color: Colors.yellow.shade700),
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
                          border: Border.all(color: Colors.yellow.shade700),
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
                        onPressed: () { },
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ]);
            }
          },
        ),
      ),
    );
  }
}
