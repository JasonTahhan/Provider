import 'package:flutter/material.dart';
import 'package:task6/Models/CountryModel.dart';
import 'package:task6/Models/StateModel.dart';
import 'package:task6/Models/CityModel.dart';
import 'package:task6/Models/LanguageModel.dart';

class SelectedData extends StatelessWidget {
  final CountryModel? selectedCountry;
  final StateModel? selectedState;
  final CityModel? selectedCity;
  final LanguageModel? selectedLanguage;

  SelectedData({
    this.selectedCountry,
    this.selectedState,
    this.selectedCity,
    this.selectedLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Selected Country: ${selectedCountry?.countryName ?? 'N/A'}'),
            Text('Selected State: ${selectedState?.stateName ?? 'N/A'}'),
            Text('Selected City: ${selectedCity?.cityName ?? 'N/A'}'),
            Text('Selected Language: ${selectedLanguage?.languageDescription ?? 'N/A'}'),
          ],
        ),
      ),
    );
  }
}
