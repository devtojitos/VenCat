enum BusinessOperationJobsModel{

  marketing._("Marketing"),
  finance._("Finance"),
  labor._("labor"),
  itTech._("It Tech"),
  medical._("medical"),
  insurance._("Insurance"),
  maintenance._("Maintenance"),
  technologyExpenses._("Technology Expenses");

  final String _operationsJobs;

  const BusinessOperationJobsModel._(this._operationsJobs);


  @override
  String toString() => _operationsJobs;
}