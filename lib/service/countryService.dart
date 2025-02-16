import 'package:http/http.dart' as http;
import 'package:country_info/model/country_model.dart';
import 'dart:convert';

class CountryService {
 Future<List<Country>> getAllCountries() async {
    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }
}
