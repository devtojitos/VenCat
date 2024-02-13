enum BusinessFinanceBusinessModelsModel{
  B2B._("B2B"),
  B2C ._("B2C"),
  C2C ._("C2C"),
  freemium._("Freemium"),
  subscriptionBased._("Subscription Based"),
  ecommerce._("E-commerce"),
  marketplace._("Marketplace");

  final String _businessModel;

  const BusinessFinanceBusinessModelsModel._(this._businessModel);


  @override
  String toString() => _businessModel;

}