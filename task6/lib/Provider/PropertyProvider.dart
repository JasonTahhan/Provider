import 'package:flutter/material.dart';
import 'package:task6/Models/PropertyModel.dart';
import 'package:task6/Service/property_service.dart';

class PropertyProvider extends ChangeNotifier {
  
final PropertyService _propertyService = PropertyService();
 
 List<PropertyModel> _properties= [];
 List<PropertyModel> get properties=> _properties;
 PropertyModel? _selectedProperty;
 PropertyModel? get selectedProperty => _selectedProperty;
 

  Future<void> loadAvailableProperties() async {
    try {
      _properties = await _propertyService.getAllAvailableProperties();
      print('${_properties}');
      setSelectedProperty(_properties.first);
      notifyListeners();
    } catch (e) {
      print('Error loading available properties: $e');
    }
  }

  void setSelectedProperty(PropertyModel? property) {
    _selectedProperty = property;
    notifyListeners();
  }

}