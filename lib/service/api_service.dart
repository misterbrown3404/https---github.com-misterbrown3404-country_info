
import 'dart:convert';

import 'package:country_info/model/country_model.dart';
import 'package:http/http.dart' as http;

class CountryApi {
  Future<List<Country>?> getAllCountries() async {
    var client = http.Client();
    var uri = Uri.parse('https://restcountries.com/v3.1/all');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return List<Country>.from(json.decode(const Utf8Decoder().convert(response.bodyBytes)).map((data) => Country.fromJson(data)));
    }
    return null;
  }
}