import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../DataModel/UserModel/user_model.dart';

class ProjectUserFirebase {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  Future<List<UserModel>> getUsersJoined(String projectId) async {
    List<UserModel> list = [];

    var sourceList = await _databaseReference
        .child(projectId)
        .child("projectMembersJoined")
        .once();
    var data = sourceList.snapshot;
    List<dynamic> projectMembers = data.value as List<dynamic>;

    await Future.forEach(projectMembers, (dynamic memberId) async {
      var sourceMembers = await _databaseReference
          .child("users")
          .child(memberId.toString())
          .once();
      var dataMembers = sourceMembers.snapshot;

      if (dataMembers.value != null) {
        UserModel userModel = UserModel.fromJson(
          jsonDecode(
            jsonEncode(dataMembers.value),
          ),
        );
        list.add(userModel);
      }
    });

    return list;
  }

  Future<List<UserModel>> getUsersRequested(String projectId) async {
    List<UserModel> list = [];

    var sourceList = await _databaseReference
        .child(projectId)
        .child("projectMembersRequest")
        .once();
    var data = sourceList.snapshot;
    List<dynamic> projectMembers = data.value as List<dynamic>;

    await Future.forEach(projectMembers, (dynamic memberId) async {
      var sourceMembers = await _databaseReference
          .child("users")
          .child(memberId.toString())
          .once();
      var dataMembers = sourceMembers.snapshot;

      if (dataMembers.value != null) {
        UserModel userModel = UserModel.fromJson(
          jsonDecode(
            jsonEncode(dataMembers.value),
          ),
        );
        list.add(userModel);
      }
    });

    return list;
  }

  Future<bool> addUserRequest(String userId, String ProjectId,) async {
    var source = await _databaseReference
        .child("projects")
        .child(ProjectId)
        .child("projectMembersRequest")
        .push();

    return true;
  }

  Future<bool> addUserJoined(String userId, String ProjectId) async {
    var source = await _databaseReference
        .child(ProjectId)
        .child("projectMemebersJoined")
        .push();

    return true;
  }
}
