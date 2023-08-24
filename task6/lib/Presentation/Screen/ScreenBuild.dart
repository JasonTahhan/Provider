import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/Models/CountryModel.dart';
import 'package:task6/Models/StateModel.dart';
import 'package:task6/Models/CityModel.dart';
import 'package:task6/Models/LanguageModel.dart';
import 'package:task6/Provider/Provider.dart';
import 'package:task6/Presentation/Screen/SelectedData.dart';

class DataSelectionDisplay extends StatefulWidget {
  @override
  State<DataSelectionDisplay> createState() => _DataSelectionDisplayState();
}

class _DataSelectionDisplayState extends State<DataSelectionDisplay> {
  @override
  void initState() async{
    super.initState();
    await Provider.of<DataSelectionProvider>(context, listen: false).fetchCountries();
    await Provider.of<DataSelectionProvider>(context, listen: false).getAllPreferredLanguages();
  }

  void _navigateToSelectedData() {
    final dataProvider = Provider.of<DataSelectionProvider>(context, listen: false);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectedData(
          selectedCountry: dataProvider.selectedCountry,
          selectedState: dataProvider.selectedState,
          selectedCity: dataProvider.selectedCity,
          selectedLanguage: dataProvider.selectedLanguage,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataSelectionProvider>(context);

    return Scaffold(
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                'Complete Your Profile',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Text(
                  'JT',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              SizedBox(height: 30),
              DropdownButton<CountryModel>(
                value: dataProvider.selectedCountry,
                onChanged: (CountryModel? country) {
                  dataProvider.setSelectedCountry(country);
                  dataProvider.setSelectedState(null);
                  dataProvider.setSelectedCity(null);
                  if (country != null) {
                    dataProvider.fetchStatesForCountry(country.countryId!);
                  }
                },
                items: dataProvider.countries
                    .map<DropdownMenuItem<CountryModel>>(
                      (CountryModel country) => DropdownMenuItem<CountryModel>(
                        value: country,
                        child: Text(country.countryName!),
                      ),
                    )
                    .toList(),
                hint: Text('Select a country'),
              ),
              SizedBox(height: 16.0),
              DropdownButton<StateModel>(
                value: dataProvider.selectedState,
                onChanged: (StateModel? state) {
                  dataProvider.setSelectedState(state);
                  dataProvider.setSelectedCity(null);
                  if (state != null) {
                    dataProvider.getAllCitiesByStateId(state.idState!);
                  }
                },
                items: dataProvider.states
                    .map<DropdownMenuItem<StateModel>>(
                      (StateModel state) => DropdownMenuItem<StateModel>(
                        value: state,
                        child: Text(state.stateName!),
                      ),
                    )
                    .toList(),
                hint: Text('Select a state'),
              ),
              SizedBox(height: 16.0),
              DropdownButton<CityModel>(
                value: dataProvider.selectedCity,
                onChanged: (CityModel? city) {
                  dataProvider.setSelectedCity(city);
                },
                items: dataProvider.cities
                    .map<DropdownMenuItem<CityModel>>(
                      (CityModel city) => DropdownMenuItem<CityModel>(
                        value: city,
                        child: Text(city.cityName!),
                      ),
                    )
                    .toList(),
                hint: Text('Select a city'),
              ),
              SizedBox(height: 16.0),
              DropdownButton<LanguageModel>(
                value: dataProvider.selectedLanguage,
                onChanged: (LanguageModel? language) {
                  dataProvider.setSelectedLanguage(language);
                },
                items: dataProvider.preferredLanguages
                    .map<DropdownMenuItem<LanguageModel>>(
                      (LanguageModel language) => DropdownMenuItem<LanguageModel>(
                        value: language,
                        child: Text(language.languageDescription),
                      ),
                    )
                    .toList(),
                hint: Text('Select a preferred language'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _navigateToSelectedData,
                child: Text('Save'),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

