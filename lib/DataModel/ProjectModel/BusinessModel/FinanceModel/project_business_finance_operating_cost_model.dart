enum BusinessFinanceOperatingCostModel{
  marketing._("Marketing"),
  rent._("Rent"),
  salariesAndWages._("Salaries and Wages"),
  utilities._("Utilities"),
  materialsAndInventory._("Materials and Inventory"),
  insurance._("Insurance"),
  maintenance._("Maintenance"),
  technologyExpenses._("Technology Expenses");

  final String _operatingCost;

  const BusinessFinanceOperatingCostModel._(this._operatingCost);


  @override
  String toString() => _operatingCost;

}