enum BusinessMarketingTargetAgeModel{
  children ._("Children "),
  teenagers  ._("Teenagers"),
  youngAdults._("Young Adults "),
  middleAgedAdults._("MiddleAged Adults"),
  seniors._("Seniors ");

  final String _age;

  const BusinessMarketingTargetAgeModel._(this._age);

  @override
  String toString() => _age;

}