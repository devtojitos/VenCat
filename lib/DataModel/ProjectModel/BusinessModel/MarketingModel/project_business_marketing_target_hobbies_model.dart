enum BusinessMarketingTargetHobbiesModel{
  sportsAndOutdoors._("Sports and Outdoors"),
  artsAndDrawing ._("Arts and Drawing"),
  serviceIndustry ._("Service Industry"),
  student._("Student"),
  houseWife._("HouseWife");

  final String _hobbies;

  const BusinessMarketingTargetHobbiesModel._(this._hobbies);

  @override
  String toString() => _hobbies;

}