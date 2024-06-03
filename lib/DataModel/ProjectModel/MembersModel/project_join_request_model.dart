class ProjectJoinRequestModel {
  String joinRequestId = "", projectId = "", userId = "";
  int joinRequestDate = 0;

  ProjectJoinRequestModel(
      this.joinRequestId, this.projectId, this.userId, this.joinRequestDate);

  ProjectJoinRequestModel.fromJson(Map<String,dynamic>json){
    joinRequestDate = json["joinRequestDate"];
    joinRequestId = json["joinRequestId"];
    userId = json["userId"];
    projectId = json["projectId"];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['joinRequestDate'] = joinRequestDate;
    data['joinRequestId'] = joinRequestId;
    data['userId'] = userId;
    data['projectId'] = projectId;



    return data;

  }
}
