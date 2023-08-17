class ParkingModel{
  String _imageUrl;
  String _title;
  String _description;
  String _price;
  String _available_parking;
  String _rate;

  get imageUrl => _imageUrl;
  get title => _title;
  get description => _description;
  get price => _price;
  get available_parking => _available_parking;
  get rate => _rate;

  ParkingModel(this._imageUrl, this._title, this._description, this._price, this._available_parking, this._rate);
}