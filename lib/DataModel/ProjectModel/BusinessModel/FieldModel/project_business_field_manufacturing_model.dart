enum BusinessFieldManufacturingModel{
  foodAndBeverage._("food and beverage"),
  textileAndApparel._("textile and apparel"),
  chemicalAndPharma._("chemical and pharma"),
  electronic._("electronics"),
  heavyDutyMachinery._("heavy-duty machinery"),
  toolsAndEquipment._("tools and equipments");

  final String _manufacturing;

  const BusinessFieldManufacturingModel._(this._manufacturing);


  @override
  String toString() => _manufacturing;

}