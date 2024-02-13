enum BusinessMarketingTargetOccupationModel{
  professional._("Professional"),
  skilledTrades ._("Skilled Trades"),
  serviceIndustry ._("Service Industry"),
  student._("Student"),
  houseWife._("HouseWife");

  final String _occupation;

  const BusinessMarketingTargetOccupationModel._(this._occupation);

  @override
  String toString() => _occupation;

}