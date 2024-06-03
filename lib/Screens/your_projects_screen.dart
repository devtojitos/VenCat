import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vencat/Firebase/project_list_firebase.dart';

import '../DataModel/ProjectModel/BusinessModel/project_business_model.dart';
import 'Project_Create_Screens/create_project_overview_screen.dart';

class YourProjectsScreen extends StatelessWidget {
  const YourProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProjectService userProjectService = UserProjectService();
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
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
          Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Published Projects"),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: FutureBuilder(
                              future: userProjectService.GetAllPublishedProjectByUserId(
                                  FirebaseAuth.instance.currentUser!.uid),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text("Error: ${snapshot.error}");
                                } else if (snapshot.hasData) {
                                  var projects = snapshot.data
                                      as List<ProjectBusinessModel>;
                                  return Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: projects.length,
                                            itemBuilder: (context, index) {
                                              var project = projects[index];

                                              return Card(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black)),
                                                  width: 80,
                                                  height: 120,
                                                  child: Center(
                                                    child: Container(
                                                      child: Text(project
                                                          .businessBasicInfoModel!
                                                          .businessTitle),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  );
                                } else {
                                  return const Text("no Data found");
                                }
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Joined Projects"),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * 0.8,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Draft Projects"),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.14,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: FutureBuilder(
                            future: userProjectService.GetAllDraftProjectByUserId(
                                FirebaseAuth.instance.currentUser!.uid),
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
                                return Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: projects.length,
                                          itemBuilder: (context, index) {
                                            var project = projects[index];

                                            return Card(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black)),
                                                width: 80,
                                                height: 120,
                                                child: Center(
                                                  child: Container(
                                                    child: Text(project
                                                        .businessBasicInfoModel!
                                                        .businessTitle),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                );
                              } else {
                                return const Text("no Data found");
                              }
                            }),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blue.shade400,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => CreateProjectOverviewScreen());
                  },
                  child: Text("Create Project"),
                ),
              ),
            ],
          ),
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
        ],
      ),
    ));
  }
}
