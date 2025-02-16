import 'package:country_info/model/country_model.dart';
import 'package:flutter/material.dart';

class CountryDetailsPage extends StatelessWidget {
  final Country country;

  const CountryDetailsPage({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name?.common ?? 'Country Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Country Flag
            Center(
              child: country.flags?.png != null
                  ? Container(
                      height: 200,
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        country.flags!.png!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const Icon(Icons.flag_rounded, size: 80),
            ),
            const SizedBox(height: 16),

            // ✅ Country Info
            _infoTile("Population", country.population?.toString() ?? 'N/A'),
            _infoTile("Region", country.region ?? 'Unknown'),
            _infoTile("Capital", country.capital?.isNotEmpty == true ? country.capital!.first : 'No capital'),
            _infoTile("Language", country.languages.toString()),
            
            SizedBox(height: 15,),

            _infoTile("Official Name", country.name?.official ?? 'N/A'),
            _infoTile("Ethinic Group", country.translations.toString()),
            _infoTile("Car", country.car!.side!),
            _infoTile("Dailing Code", country.cca3.toString()),

              const SizedBox(height: 15,),

            _infoTile("Currency", country.currencies!.shp!.toString()),
            _infoTile("Independent", country.independent.toString()),
            _infoTile("Area", "${country.area?.toString()} km²"),
            _infoTile("TimeZone", country.timezones.toString()),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Displaying Info
  Widget _infoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
