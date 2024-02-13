enum BusinessFieldAgricultureModel{
  cropFarming._("crop farming"),
  livestock._("livestock"),
  horticulture._("horticulture");

  final String _agriculture;

  const BusinessFieldAgricultureModel._(this._agriculture);


  @override
  String toString() => _agriculture;

}