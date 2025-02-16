import 'package:country_info/screen/home_screen.dart';
import 'package:country_info/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget { 
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          title: 'Country App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
          home: HomePage(),
        ));
  }
}
