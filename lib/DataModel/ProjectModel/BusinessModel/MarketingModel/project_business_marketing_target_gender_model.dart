enum BusinessMarketingTargetGenderModel{
  professional._("Professional"),
  skilledTrades ._("Skilled Trades"),
  serviceIndustry ._("Service Industry"),
  student._("Student"),
  houseWife._("HouseWife");

  final String _gender;

  const BusinessMarketingTargetGenderModel._(this._gender);

  @override
  String toString() => _gender;

}