enum BusinessFieldCommerceModel{
  clothing._("clothing"),
  footwear._("footwear"),
  accessories._("accessories"),
  beautyProducts._("beauty products"),
  electronic._("electronics"),
  homeAndLifeStyle._("home and life style"),
  generalMerchandise._("general merchandise"),
  foodAndBeverage._("food and beverage"),
  healthAndWellness._("health and wellness"),
  artsAndCrafts._("arts and crafts"),
  techAndGadgets._("Automotive"),
  travelAndTourism._("travel and tourism"),
  sportsAndOutdoor._("sports and outdoor"),
  jewelryAndWatches._("jewelry and watches"),
  petCare._("pet care"),
  photographyEquipment._("photography equipment");

  final String _commerce;

  const BusinessFieldCommerceModel._(this._commerce);


  @override
  String toString() => _commerce;

}