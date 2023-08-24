import 'SpaceModel.dart';

class PropertyModel {
  String propertyId;
  String propertyName;
  List<SpaceModel> availableSpaces;

  PropertyModel({
    required this.propertyId,
    required this.propertyName,
    required this.availableSpaces,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    var availableSpacesData = json['availableSpaces'] as List;
    List<SpaceModel> availableSpaces = availableSpacesData
        .map((spaceJson) => SpaceModel.fromJson(spaceJson))
        .toList();

    return PropertyModel(
      propertyId: json['propertyId'],
      propertyName: json['propertyName'],
      availableSpaces: availableSpaces,
    );
  }

  }