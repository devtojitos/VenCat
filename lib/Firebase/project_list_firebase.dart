import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/project_business_model.dart';

import '../DataModel/ProjectModel/project_model.dart';

class UserProjectService {


  Future<List<ProjectModel>> GetAllProjectByUserId(String userId) async {
    List<ProjectModel> list = [];
    var source = await FirebaseDatabase.instance
        .ref("Projects")
        .child("Published")
        .orderByChild("userId")
        .equalTo(userId)
        .once();
    var data = source.snapshot;
    ProjectModel? projectModel;

    data.children.forEach(
          (element) {
        projectModel = ProjectModel.fromJson(
          jsonDecode(
            jsonEncode(element.value),
          ),
        );
        projectModel?.projectId=element.key!;
        list.add(projectModel!);
      },
    );

    return list;
  }
  Future<List<ProjectBusinessModel>> GetAllPublishedProjectByUserId(String userId) async {
    List<ProjectBusinessModel> list = [];
    var source = await FirebaseDatabase.instance
        .ref("Projects")
        .child("Published")
        .orderByChild("userId")
        .equalTo(userId)
        .once();
    var data = source.snapshot;
    ProjectBusinessModel? projectBusinessModel;

    data.children.forEach(
          (element) {
        projectBusinessModel = ProjectBusinessModel.fromJson(
          jsonDecode(
            jsonEncode(element.value),
          ),
        );

        list.add(projectBusinessModel!);
      },
    );

    return list;
  }

  Future<List<ProjectBusinessModel>> GetAllDraftProjectByUserId(String userId) async {
    List<ProjectBusinessModel> list = [];
    var source = await FirebaseDatabase.instance
        .ref("Projects")
        .child("Drafts")
        .orderByChild("userId")
        .equalTo(userId)
        .once();
    var data = source.snapshot;
    ProjectBusinessModel? projectBusinessModel;

    data.children.forEach(
          (element) {
        projectBusinessModel = ProjectBusinessModel.fromJson(
          jsonDecode(
            jsonEncode(element.value),
          ),
        );
        list.add(projectBusinessModel!);
      },
    );

    return list;
  }


  Future<List<ProjectBusinessModel>> GetAllJoinedProjectByUserId(String userId) async {
    List<ProjectBusinessModel> list = [];
    var source = await FirebaseDatabase.instance
        .ref("Projects")
        .child("Published")
        .child("usersSubscribed")
        .orderByChild("userId")
        .equalTo(userId)
        .once();
    var data = source.snapshot;
    ProjectBusinessModel? projectBusinessModel;

    data.children.forEach(
          (element) {
        projectBusinessModel = ProjectBusinessModel.fromJson(
          jsonDecode(
            jsonEncode(element.value),
          ),
        );
        list.add(projectBusinessModel!);
      },
    );

    return list;
  }


}
