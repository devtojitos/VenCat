enum BusinessMarketingStrategyModel{
  socialMediaMarketing._("Social Media Marketing"),
  contentMarketing._("Content Marketing"),
  emailMarketing._("Email Marketing"),
  influencerPartnerships._("Influencer Partnerships"),
  affiliateMarketing._("Affiliate Marketing"),
  events._("Events"),
  publicRelations._("Public Relations");


  final String _strategy;

  const BusinessMarketingStrategyModel._(this._strategy);


  @override
  String toString() => _strategy;

}