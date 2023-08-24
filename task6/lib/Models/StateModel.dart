import 'CityModel.dart';

class StateModel {
  final String? idState;
  final String? stateName;
  final String? stateCode;
  final List<CityModel> cityVOList;

  StateModel({
    this.idState,
    this.stateName,
    this.stateCode,
    this.cityVOList = const [],
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        idState: json["idState"],
        stateName: json["stateName"],
        stateCode: json["stateCode"],
        cityVOList: List<CityModel>.from(
          json["cityVOList"].map((x) => CityModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "idState": idState,
        "stateName": stateName,
        "stateCode": stateCode,
        "cityVOList": List<dynamic>.from(cityVOList.map((x) => x.toJson())),
      };
  @override
  String toString() {
    return 'StateModel(idState: $idState, stateName: $stateName, stateCode: $stateCode, cityVOList: $cityVOList)';
  }
}