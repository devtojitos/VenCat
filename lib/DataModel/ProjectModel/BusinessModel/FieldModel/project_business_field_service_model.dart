enum BusinessFieldServiceModel{
  healthcare._("healthcare"),
  educationAndTraining._("education and training"),
  itAndSoftware._("it and software"),
  beautyCenterAndSalon._("beauty centers and salon"),
  hospitalityAndTourism._("hospitality and tourism"),
  financialService._("financial services"),
  realEstate._("real estate"),
  transportationAndLogistics._("transportation and logistics"),
  marketingAndAdvertising._("marketing and advertising"),
  legalService._("legal services"),
  eventPlanning._("event planning"),
  environmentalService._("environmental services"),
  constructions._("construction "),
  petCare._("pet care"),
  photographyService._("photography service");

  final String _service;

  const BusinessFieldServiceModel._(this._service);


  @override
  String toString() => _service;

}