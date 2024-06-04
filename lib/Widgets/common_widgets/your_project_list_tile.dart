import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vencat/Firebase/project_list_firebase.dart';

import '../../DataModel/ProjectModel/project_model.dart';


class YourProjectsFutureList extends StatefulWidget {

  YourProjectsFutureList({super.key});

  @override
  State<YourProjectsFutureList> createState() => _YourProjectsFutureListState();
}

class _YourProjectsFutureListState extends State<YourProjectsFutureList> {
  UserProjectService _userProjectService =UserProjectService();

  String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw FutureBuilder(
        future: _userProjectService.GetAllProjectByUserId(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            List projects = snapshot.data!;
            return ListView.builder(
                itemCount: projects.length,
                itemBuilder: (BuildContext context, int index) {
                  ProjectModel projectModel = projects[index];
                  return ListTile(
                    title: Text(projectModel.projectBusinessModel!
                        .businessBasicInfoModel!.businessTitle),

                  );
                });
          } else {
            return const Text("no Data found");
          }
        });
  }
}
