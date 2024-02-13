enum BusinessFinanceRevenueStreamModel{
  B2B._("B2B"),
  B2C ._("B2C"),
  C2C ._("C2C"),
  freemium._("Freemium"),
  subscriptionBased._("Subscription Based"),
  ecommerce._("E-commerce"),
  marketplace._("Marketplace");

  final String _revenueStream;

  const BusinessFinanceRevenueStreamModel._(this._revenueStream);

  @override
  String toString() => _revenueStream;

}