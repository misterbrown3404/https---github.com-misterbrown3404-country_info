
import 'package:country_info/model/country_model.dart';
import 'package:country_info/service/api_service.dart';

class CountryService {
  final _api = CountryApi();

  Future<List<Country>?> getAllCountries({String? timezone, String? region}) async {
    List<Country>? allCountries = await _api.getAllCountries();
    
    if (allCountries == null) return null;

    // ✅ Apply Filters
    return allCountries.where((country) {
      bool matchesRegion = region == null || country.region?.toLowerCase() == region.toLowerCase();
      bool matchesTimezone = timezone == null || (country.timezones?.any((tz) => tz.contains(timezone)) ?? false);

      return matchesRegion && matchesTimezone;
    }).toList();
  }
}
