import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_info/controllers/country_controller.dart';
import 'package:country_info/model/country_model.dart';
import 'package:country_info/theme/theme_controller.dart';
import 'package:country_info/view/country_details.dart';

enum SortType { name, timezone, continent }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ThemeController themeController = Get.find<ThemeController>();
  List<Country>? countries;
  List<Country>? filteredCountries;
  bool isLoaded = false;
  SortType sortType = SortType.name;

  @override
  void initState() {
    super.initState();
    loadCountries();
  }

  Set<String> allContinents = {};
  Set<String> allTimezones = {};
  Set<String> selectedContinents = {};
  Set<String> selectedTimezones = {};

  Future<void> loadCountries() async {
    final countryService = CountryService();
    countries = await countryService.getAllCountries();

    for (var country in countries!) {
      if (country.continents != null) {
        allContinents
            .addAll(country.continents!); // Store all available continents
      }
      if (country.timezones != null) {
        allTimezones
            .addAll(country.timezones!); // Store all available timezones
      }
    }

    setState(() {
      isLoaded = true;
      filteredCountries = List.from(countries!); // Ensure it loads initially
    });
    sortCountries(sortType);
  }

  void sortCountries(SortType type) {
    setState(() {
      sortType = type;
    });
    if (filteredCountries != null) {
      filteredCountries!.sort((a, b) {
        switch (type) {
          case SortType.name:
            return a.name?.common
                    ?.toLowerCase()
                    .compareTo(b.name?.common?.toLowerCase() ?? '') ??
                0;
          default:
            return 0;
        }
      });
    }
    setState(() {});
  }

  void filterCountries() {
    setState(() {
      if (selectedContinents.isEmpty && selectedTimezones.isEmpty) {
        // Reset to default list
        filteredCountries = List.from(countries!);
      } else {
        filteredCountries = countries!.where((country) {
          bool matchesContinent = selectedContinents.isEmpty ||
              (country.continents != null &&
                  country.continents!
                      .any((c) => selectedContinents.contains(c)));

          bool matchesTimezone = selectedTimezones.isEmpty ||
              (country.timezones != null &&
                  country.timezones!.any(selectedTimezones.contains));

          return matchesContinent && matchesTimezone;
        }).toList();
      }
    });
  }

  void searchCountry(String place) {
    if (countries != null) {
      setState(() {
        countries = countries!
            .where((c) =>
                c.name!.common!.toLowerCase().contains(place.toLowerCase()) ||
                (c.continents != null && c.continents!.isNotEmpty ? c.continents!.first.toLowerCase().contains(place.toLowerCase()) : false))
            .toList();
      });
    }
  }
  
  void showFilterBottomSheet(BuildContext context) {
  double sheetHeight = 0.3; // Default height
  bool showTimezoneTile = true; // Controls ListTile visibility

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: MediaQuery.of(context).size.height * sheetHeight,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Close Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Filter",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        // 🌍 Continent Selection

                        // ⏳ Timezone Selection (Expands Bottom Sheet)
                        if (showTimezoneTile)
                          ListTile(
                            title: const Text("Select Continent"),
                            trailing: const Icon(Icons.keyboard_arrow_down),
                            onTap: () {
                              setState(() {
                                sheetHeight = 0.8; // Expand bottom sheet
                                showTimezoneTile = false; // Hide ListTile
                              });
                              
                            },
                          ),

                        // Timezone Checkboxes (Only Appear When Expanded)
                        if (sheetHeight > 0.5)
                          _buildCheckboxSection(
                            title: "Select Continent",
                            items: allContinents.toList(),
                            selectedItems: selectedContinents,
                            onSelect: (value) {
                              setState(() {
                                if (selectedContinents.contains(value)) {
                                  selectedContinents.remove(value);
                                } else {
                                  selectedContinents.add(value);
                                }
                              });
                            },
                          ),

                        const SizedBox(height: 10),

                        // Timezone Selection
                        _buildCheckboxSection(
                          title: "Select Timezone",
                          items: allTimezones.toList(),
                          selectedItems: selectedTimezones,
                          onSelect: (value) {
                            setState(() {
                              if (selectedTimezones.contains(value)) {
                                selectedTimezones.remove(value);
                              } else {
                                selectedTimezones.add(value);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // 🔄 Reset & Show Result Buttons (Always Visible)
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         GestureDetector(
                        onTap:() {
                            setState(() {
                              selectedContinents.clear();
                              selectedTimezones.clear();
                              sheetHeight = 0.3; // Collapse back
                              showTimezoneTile = true; // Show ListTile again
                            });
                          },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              ),
                          child: 
                              const Center(child: Text("Reset")),
                            
                          
                        ),
                      ),
                        GestureDetector(
                        onTap:() {
                             filterCountries();
                            Navigator.pop(context);
                          },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                              border: Border.all(color: Colors.orange),
                              ),
                          child: 
                              const Center(child: Text("Show Result",style: TextStyle(color: Colors.white),)),
                            
                          
                        ),
                      ),
                       
                       
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

  Widget _buildCheckboxSection({
    required String title,
    required List<String> items,
    required Set<String> selectedItems,
    required Function(String) onSelect,
  }) {
    return ExpansionTile(
      title: Text(title),
      children: items.map((item) {
        return CheckboxListTile(
          title: Text(item),
          value: selectedItems.contains(item),
          onChanged: (bool? selected) {
            onSelect(item);
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Image.asset(
              themeController.isDarkMode.value
                  ? 'assets/icons/1000760031.png'
                  : 'assets/icons/1000760030.png',
              height: 30,
            )),
        actions: [
          IconButton(
            icon: Obx(() => Icon(
                  themeController.isDarkMode.value
                      ? Icons.dark_mode
                      : Icons.wb_sunny_rounded,
                )),
            onPressed: () => themeController.toggleTheme(),
          ),
        ],
      ),
      body: isLoaded && filteredCountries != null
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: searchCountry,
                    decoration: InputDecoration(
                      hintText: "Search country",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => showFilterBottomSheet(context),
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.filter_list),
                              Text("Filter"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredCountries!.length,
                    itemBuilder: (context, index) {
                      final country = filteredCountries![index];
                      return ListTile(
                        leading: country.flags?.png != null
                            ? Container(
                                height: 40,
                                width: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(8)),
                                clipBehavior: Clip.hardEdge,
                                child: Image.network(country.flags!.png!,
                                    fit: BoxFit.cover),
                              )
                            : const Icon(Icons.flag_rounded),
                        title: Text(country.name?.common ?? 'No name'),
                        subtitle: Text(country.capital?.isNotEmpty == true
                            ? country.capital!.first
                            : 'No capital'),
                        onTap: () =>
                            Get.to(() => CountryDetailsPage(country: country)),
                      );
                    },
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
