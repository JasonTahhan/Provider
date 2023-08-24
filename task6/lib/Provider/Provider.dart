import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task6/Models/CountryModel.dart';
import 'package:task6/Models/StateModel.dart';
import 'package:task6/Models/CityModel.dart';
import 'package:task6/Models/LanguageModel.dart';
import 'package:task6/Service/Services.dart';

class DataSelectionProvider with ChangeNotifier {
  final CountryStateDropdowns _service = CountryStateDropdowns();
  List<CountryModel> _countries = [];
  List<StateModel> _states = [];
  List<CityModel> _cities = [];
  List<LanguageModel> _preferredLanguages = [];

  CountryModel? _selectedCountry;
  StateModel? _selectedState;
  CityModel? _selectedCity;
  LanguageModel? _selectedLanguage;

  CountryModel? get selectedCountry => _selectedCountry;
  StateModel? get selectedState => _selectedState;
  CityModel? get selectedCity => _selectedCity;
  LanguageModel? get selectedLanguage => _selectedLanguage;

  List<CountryModel> get countries => _countries;
  List<StateModel> get states => _states;
  List<CityModel> get cities => _cities;
  List<LanguageModel> get preferredLanguages => _preferredLanguages;


  Future<void> fetchCountries() async {
    try {
      _countries = await _service.fetchCountries();
      notifyListeners();
    } catch (e) {
      print('Error fetching countries: $e');
    }
  }

  Future<void> fetchStatesForCountry(String countryId) async {
    print('fetch states');
    try {
      _states = await _service.getAllStatesByCountryId(countryId);
      notifyListeners();
    } catch (e) {
      print('Error fetching states: $e');
    }
  }

  Future<void> getAllCitiesByStateId(String stateId) async {
    try {
      _cities = await _service.getAllCitiesByStateId(stateId);
      notifyListeners();
    } catch (e) {
      print('Error fetching cities: $e');
    }
  }

  Future<void> getAllPreferredLanguages() async {
    try {
      _preferredLanguages = await _service.getAllPreferredLanguages();
      notifyListeners();
    } catch (e) {
      print('Error fetching preferred languages: $e');
    }
  }

  void setSelectedCountry(CountryModel? country) {
    _selectedCountry = country;
    notifyListeners();
  }

  void setSelectedState(StateModel? state) {
    _selectedState = state;
    notifyListeners();
  }

  void setSelectedCity(CityModel? city) {
    _selectedCity = city;
    notifyListeners();
  }

  void setSelectedLanguage(LanguageModel? language) {
    _selectedLanguage = language;
    notifyListeners();
  }
}