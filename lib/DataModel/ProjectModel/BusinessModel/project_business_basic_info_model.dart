import 'FieldModel/project_business_field_options_model.dart';

class BusinessBasicInfoModel {
  final String businessTitle,
      businessDescription,
      businessLocationCity,
      businessLocationArea,
      businessType,
      businessField;

  final int businessCapital, partnersNumber;

  BusinessBasicInfoModel(
      {required this.businessField,
      required this.businessType,
      required this.businessTitle,
      required this.businessLocationCity,
      required this.businessDescription,
      required this.businessLocationArea,
      required this.businessCapital,
      required this.partnersNumber});

  factory BusinessBasicInfoModel.fromJson(Map<String, dynamic> json) {
    return BusinessBasicInfoModel(
      businessTitle: json["businessTitle"],
      businessField:json["businessField"],
      businessType: json["businessType"],
      businessLocationCity: json["businessLocationCity"],
      businessDescription: json["businessDescription"],
      businessLocationArea: json["businessLocationArea"],
      businessCapital: json["businessCapital"],
      partnersNumber: json["partnersNumber"],
    );
  }

  Map<String,dynamic> toJson(){
    return{
      "businessTitle" :businessTitle,
      "businessField" : businessField,
      "businessType" : businessType,
      "businessLocationCity":businessLocationCity,
      "businessLocationArea":businessLocationArea,
      "businessDescription": businessDescription,
      "businessCapital":businessCapital,
      "partnersNumber":partnersNumber,
    };
  }
}
