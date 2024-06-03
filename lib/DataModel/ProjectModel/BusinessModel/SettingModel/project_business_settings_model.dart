class BusinessSettingsModel {

  final bool investorsType;
  final bool projectType;
  final bool? checkShowCase ;
  final bool? checkmessaging ;
  final bool? checkSubscribersOpen ;
  final bool? checkSubscribersClose ;
  final bool? partnersInvest ;
  final bool? partnersPartner ;


  BusinessSettingsModel(
      {required this.investorsType,
      required this.projectType,
      this.checkShowCase,
      this.checkmessaging,
      this.checkSubscribersOpen,
      this.checkSubscribersClose,
      this.partnersInvest,
      this.partnersPartner});
  factory BusinessSettingsModel.fromJson(Map<String, dynamic> json) {
    return BusinessSettingsModel(
      investorsType: json['investorsType'],
      projectType: json['projectType'],
      checkmessaging: json['checkmessaging'],
      checkShowCase: json['checkShowCase'],
      checkSubscribersClose: json['checkSubscriptionOpen'],
      checkSubscribersOpen: json['checkSubscribersClose'],
      partnersInvest: json['partnersInvest'],
      partnersPartner: json['partnersPartner']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'investorsType': investorsType,
      'projectType': projectType,
      'checkmessaging':checkmessaging,
      'checkShowCase':checkShowCase,
      'checkSubscribersClose':checkSubscribersClose,
      'checkSubscribersOpen':checkSubscribersOpen,
      'partnersInvest':partnersInvest,
      'partnersPartner':partnersPartner,



    };
  }
}
