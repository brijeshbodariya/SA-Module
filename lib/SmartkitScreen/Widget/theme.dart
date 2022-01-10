import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primarySwatch: createMaterialColor(Colors.white),
  primaryColor: Colors.black,
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: createMaterialColor(smarKitcolor1)),
  fontFamily: 'Open Sans',
  appBarTheme: AppBarTheme(
    brightness: Brightness.dark,
    elevation: 2.0,
    color: smarKitcolor2,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Color(0xFF020202),
        fontSize: 22.0,
      ),
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF020202),
    ),
  ),
);

ThemeData dark = ThemeData(
  primarySwatch: createMaterialColor(Colors.black),
  primaryColor: Colors.white,
  accentColor: Colors.black,
  accentColorBrightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    brightness: Brightness.dark,
    elevation: 2.0,
    color: Colors.black,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: createMaterialColor(Color(0xFFFFFFFF)),
        fontSize: 22.0,
      ),
    ),
    iconTheme: IconThemeData(
      color: createMaterialColor(Color(0xFFFFFFFF)),
    ),
  ),
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _prefs;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }
}
