enum BusinessFieldOptionsModel{
  commerce._("commerce"),
  manufacturing._("manufacturing"),
  agriculture._("agriculture"),
  service._("service");

  final String _field;

  const BusinessFieldOptionsModel._(this._field);


  @override
  String toString() => _field;

}