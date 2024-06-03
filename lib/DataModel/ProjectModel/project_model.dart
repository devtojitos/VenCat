import 'package:vencat/DataModel/ProjectModel/BusinessModel/project_business_model.dart';
import 'package:vencat/DataModel/ProjectModel/MembersModel/project_members_model.dart';

import 'MembersModel/project_join_request_model.dart';

class ProjectModel {
  String projectId = "",
      userId = "";
  int dateCreated = 0;
  ProjectBusinessModel? projectBusinessModel;
  List<ProjectMembersModel>? projectMembers ;
  List<ProjectJoinRequestModel>? projectJoinRequest;

  ProjectModel({
    required this.projectBusinessModel,
    required this.projectId,
    required this.userId,
    required this.dateCreated,
    required this.projectMembers, required this.projectJoinRequest,});


  ProjectModel.fromJson(Map<String, dynamic> json){
    projectId = json["projectId"];
    userId = json["userId"];
    dateCreated = json["dateCreated"];
    projectBusinessModel = ProjectBusinessModel.fromJson(json);
    if (json['projectMembers'] != null) {
      projectMembers = <ProjectMembersModel>[];
      json['projectMembers'].forEach((v) {
        projectMembers!.add(ProjectMembersModel.fromJson(v));
      });
    }
    if (json['projectJoinRequest'] != null) {
      projectJoinRequest = <ProjectJoinRequestModel>[];
      json['projectJoinRequest'].forEach((v) {
        projectJoinRequest!.add(ProjectJoinRequestModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['projectId'] = projectId;
    data['userId'] = userId;
    data['dateCreated'] = dateCreated;
    if (projectJoinRequest != null) {
      data['projectJoinRequest'] = projectJoinRequest!.map((v) => v.toJson()).toList();
    }
    if (projectMembers != null) {
      data['projectMembers'] = projectMembers!.map((v) => v.toJson()).toList();
    }

    return data;

  }
}