class BusinessOperationModel {
  int numberOfEmployees = 0;
  String operationPlanPdf = "";
  List<String> jobs = [];

  BusinessOperationModel({
    required this.numberOfEmployees,
    required this.operationPlanPdf,
    required this.jobs,
  });

  factory BusinessOperationModel.fromJson(Map<String, dynamic> json) {
    return BusinessOperationModel(
      numberOfEmployees: json["numberOfEmployees"],
      operationPlanPdf: json["operationPlanPdf"],
      jobs: List<String>.from(
        json["jobs"],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "numberOfEmployees": numberOfEmployees,
      "operationPlanPdf": operationPlanPdf,
      "jobs": jobs,
    };
  }
}
