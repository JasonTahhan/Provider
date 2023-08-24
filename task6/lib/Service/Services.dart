import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:task6/Models/CountryModel.dart';
import 'package:task6/Models/StateModel.dart';
import 'package:task6/Models/CityModel.dart';
import 'package:task6/Models/LanguageModel.dart';


class CountryStateDropdowns  {

    Future<List<CountryModel>> fetchCountries() async {
    try {
      var response = await http.get(
        Uri.parse('http://192.168.88.10:30513/otonomus/common/api/v1/countries?page=0&size=300'),
      );

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        var result = decodedResponse['data'] as List<dynamic>;
        final finalResponse = result.map((map) => CountryModel.fromJson(map)).toList();
        return finalResponse;
      } else {
        return [];
      }
    } catch (e) {
      print('Error fetching countries: $e');
      return [];
    }
  }

 Future<List<StateModel>> getAllStatesByCountryId(String countryId) async {
  try {
    var response = await http.get(Uri.parse('http://192.168.88.10:30513/otonomus/common/api/v1/country/$countryId/states'));
    print('States API Response: ${response.body}');
    var decodedResponse = jsonDecode(response.body);

    var result = decodedResponse['data'] as List;
    final finalResponse = result.map((map) => StateModel.fromJson(map)).toList();
    return finalResponse;
  } catch (e) {
    print('Error fetching states: $e');
    return [];
  }
}

Future<List<CityModel>> getAllCitiesByStateId(String idState) async {
  try {
    var response = await http.get(Uri.parse('http://192.168.88.10:30513/otonomus/common/api/v1/state/$idState/cities'));
    print('Cities API Response: ${response.body}');
    var decodedResponse = jsonDecode(response.body);
    var result = decodedResponse['data'] as List;
    final finalResponse = result.map((map) => CityModel.fromJson(map)).toList();
    return finalResponse;
  } catch (e) {
    print('Error fetching cities: $e');
    return [];
  }
}

  Future<List<LanguageModel>> getAllPreferredLanguages() async {
    try {
      var response = await http.get(Uri.parse('http://192.168.88.10:30513/otonomus/common/api/v1/languages?page=0&size=170'));
      var decodedResponse = jsonDecode(response.body);
      var result = decodedResponse['data'] as List;
      final finalResponse =
      result.map((map) => LanguageModel.fromJson(map)).toList();
      return finalResponse;
    } catch (e) {
      print('Error, unable to fetch preferred languages!');
      return [];
    }
  }
}
