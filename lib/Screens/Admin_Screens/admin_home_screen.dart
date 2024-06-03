import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vencat/Firebase/project_details_firebase.dart';

import '../../DataModel/ProjectModel/BusinessModel/project_business_model.dart';
import '../../StateController/basic_info_state.dart';
import 'admin_project_view_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    ProjectService projectServices = ProjectService();
    ProjectSelectedStateController projectSelectedStateController =
        Get.put(ProjectSelectedStateController());

    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 1, child: Column()),
          Expanded(
              flex: 8,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 200,
                    width: 140,
                    child: FutureBuilder(
                        future: projectServices.GetAllProjectSubmittedFromFirebase(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Text("Error: ${snapshot.error}");
                          } else if (snapshot.hasData) {
                            var projects =
                                snapshot.data as List<ProjectBusinessModel>;
                            return Container(
                              child: ListView.builder(
                                itemCount: projects.length,
                                itemBuilder: (context, index) {
                                  var project = projects[index];

                                  return Card(
                                    child: Column(
                                      children: [
                                        TextButton(
                                            onPressed: () {

                                              projectSelectedStateController
                                                  .selectedBusinessModel.value = projects[index];
                                              Get.to(() =>
                                                  AdminProjectViewScreen());
                                            },
                                            child: Text("view project"))
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return Text("data");
                          }
                        }),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
