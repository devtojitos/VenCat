class ProjectMembersModel {
  String userId = "";
  int joinDate = 0;

  ProjectMembersModel({required this.userId, required this.joinDate});

  ProjectMembersModel.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    joinDate = json["joinedDate"];
  }


  Map<String,dynamic> toJson(){

    final Map<String, dynamic> data = <String, dynamic>{};
    return data;

  }
}
