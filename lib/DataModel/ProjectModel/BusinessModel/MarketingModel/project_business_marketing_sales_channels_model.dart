enum BusinessMarketingSalesChannelModel{
  online ._("Online "),
  retail._("Retail"),
  wholesale._("Wholesale"),
  distributors._("Distributors"),
  directSales._("Direct Sales"),
  partnerships._("Partnerships");

  final String _salesChannel;

  const BusinessMarketingSalesChannelModel._(this._salesChannel);


  @override
  String toString() => _salesChannel;

}