import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/FinanceModel/project_business_finance_model.dart';
import 'package:vencat/DataModel/ProjectModel/BusinessModel/SettingModel/project_business_settings_model.dart';
import 'package:vencat/DataModel/ProjectModel/project_model.dart';

import '../DataModel/ProjectModel/BusinessModel/MarketingModel/project_business_marketing_model.dart';
import '../DataModel/ProjectModel/BusinessModel/BasicInfoModel/project_business_basic_info_model.dart';
import '../DataModel/ProjectModel/BusinessModel/project_business_model.dart';

class ProjectService {

  Future<bool> writeProjectAndBasicInfo(
      ProjectBusinessModel projectBusinessModel,
      BusinessBasicInfoModel businessBasicInfoModel,
      projectId) async {
    try {
      await FirebaseDatabase.instance
          .ref("Projects")
          .child("Drafts")
          .child(projectId)
          .set(projectBusinessModel.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
  Future<bool> writeProjectAndBasicInfoPublish(
      ProjectBusinessModel projectBusinessModel,
      BusinessBasicInfoModel businessBasicInfoModel,
      projectId) async {
    try {
      await FirebaseDatabase.instance
          .ref("Projects")
          .child("Drafts")
          .child(projectId)
          .set(projectBusinessModel.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
    Future<bool> writeProjectToPublish(
      ProjectBusinessModel projectBusinessModel,

      projectId) async {
    try {
      await FirebaseDatabase.instance
          .ref("Projects")
          .child("Publishedtr")
          .child(projectId)
          .set(projectBusinessModel.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
  Future<bool> writeProjectToSubmit(
      ProjectBusinessModel projectBusinessModel,

      projectId) async {
    try {
      await FirebaseDatabase.instance
          .ref("Projects")
          .child("Submitted")
          .child(projectId)
          .set(projectBusinessModel.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<ProjectBusinessModel>> GetAllProjectSubmittedFromFirebase() async {
    List<ProjectBusinessModel> list = [];
    var source = await FirebaseDatabase.instance
        .ref("Projects")
        .child("Submitted")
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

  Future<List<ProjectBusinessModel>> GetAllProjectFromFirebase() async {
    List<ProjectBusinessModel> list = [];
    var source = await FirebaseDatabase.instance
        .ref("Projects")
        .child("Published")
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

  Future<bool> editProjectAndBasicInfo(
    BusinessBasicInfoModel businessBasicInfoModel,
    String projectId,
  ) async {
    try {
      await FirebaseDatabase.instance
          .ref("Projects")
          .child("Drafts")
          .child(projectId)
          .child("businessBasicInfo")
          .update(
            businessBasicInfoModel.toJson(),
          );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> writeMarketingModelToProject(
      BusinessMarketingModel businessMarketingModel, projectId) async {
    try {
      await FirebaseDatabase.instance
          .ref("Projects")
          .child("Published")
          .child(projectId)
          .child("businessMarketingModel")
          .update(businessMarketingModel.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
  Future<bool> writeSettingsModelToProject(
      BusinessSettingsModel businessSettingsModel, projectId) async {
    try {
      await FirebaseDatabase.instance
          .ref("Projects")
          .child("Published")
          .child(projectId)
          .child("businessSettingsModel")
          .update(businessSettingsModel.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
  Future<bool> writeFinanceModelToProject(
      BusinessFinanceModel businessFinanceModel, projectId) async {
    try {
      await FirebaseDatabase.instance
          .ref("Projects")
          .child("Published")
          .child(projectId)
          .child("businessFinanceModel")
          .update(businessFinanceModel.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<BusinessMarketingModel?> getProjectBusinessMarketingModelByProjectId(
      String projectId) async {
    try {
      var snapshot = await FirebaseDatabase.instance
          .ref("Projects")
          .child("Drafts")
          .child(projectId)
          .child("businessMarketingModel")
          .once();

      var data = snapshot.snapshot.value; // Using val() to get the value

      if (data != null &&
          data is Map<dynamic, dynamic> &&
          data["SWOTAnalysisPdf"] != null &&
          data["SWOTAnalysisPdf"] is String) {
        return BusinessMarketingModel.fromJson(
          Map<String, dynamic>.from(data),
        );
      } else {
        return null;
      }
    } catch (e) {
      print("Error fetching project business model: $e");
      return null;
    }
  }

  Future<ProjectBusinessModel?> getProjectBusinessModelByUserId(
      String userId) async {
    try {
      var source = await FirebaseDatabase.instance
          .ref("Projects")
          .child("Published")
          .orderByChild("userId")
          .equalTo(userId)
          .once();

      var data = source.snapshot;

      if (data == null || data.value == null) {
        // Handle the case when no data is found.
        return null;
      }

      ProjectBusinessModel? projectBusinessModel;

      for (var element in data.children) {
        projectBusinessModel = ProjectBusinessModel.fromJson(
          jsonDecode(
            jsonEncode(element.value),
          ),
        );
      }

      return projectBusinessModel;
    } catch (e) {
      print("Error fetching project business model: $e");
      return null;
    }
  }

  Future<bool> checkIfUserHasProject(String userId) async {
    try {
      var source = await FirebaseDatabase.instance
          .ref()
          .child("Projects")
          .child("Published")
          .orderByChild(userId)
          .equalTo(userId)
          .once();
      var data = source.snapshot;
      ProjectBusinessModel? projectBusinessModel;

      data.children.forEach((element) {
        projectBusinessModel = ProjectBusinessModel.fromJson(
          jsonDecode(
            jsonEncode(data.value),
          ),
        );
      });

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> writeProjectModel(
      ProjectModel projectModel,String projectId) async {
    try {
      await FirebaseDatabase.instance
          .ref("Projects")
          .child("Published")
          .child(projectId)
          .set(projectModel.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
  Future<List<ProjectModel>> GetAllProjectModel() async {
    List<ProjectModel> list = [];
    var source = await FirebaseDatabase.instance
        .ref("Projects")
        .child("Published")
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



}
