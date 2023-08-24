class CityModel {
  final String? idCity;
  final String? cityName;

  CityModel({this.idCity, this.cityName});

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        idCity: json["idCity"],
        cityName: json["cityName"],
      );

  Map<String, dynamic> toJson() => {
        "idCity": idCity,
        "cityName": cityName,
      };

@override
  String toString() {
    return 'CityModel(idCity: $idCity, cityName: $cityName)';
    }}