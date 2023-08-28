import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/Colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDark => themeMode == ThemeMode.dark;

  void toggleTheme(bool ison) {
    themeMode = ison ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class CustomTheme {
  final ThemeData darkTheme;
  final ThemeData lightTheme;

  Color textColor;
  Color navIconColor;

  CustomTheme({
    required this.darkTheme,
    required this.lightTheme,
    required this.textColor,
    required this.navIconColor,
  });

  factory CustomTheme.fromContext(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);

    final textColor = provider.isDark ? Colors.black : Colors.white;

    final Color navIconColor =
        provider.isDark ? colors.navbarIconIADark : colors.navbarIconIALight;

    final darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(),
      dialogTheme: const DialogTheme(
        backgroundColor: Color.fromRGBO(239, 241, 255, 1),
      ),
    );

    final lightTheme = ThemeData(
      colorScheme: const ColorScheme.light(),
      dialogTheme: const DialogTheme(
        backgroundColor: Color.fromRGBO(48, 40, 76, 1),
      ),
    );

    return CustomTheme(
      darkTheme: darkTheme,
      lightTheme: lightTheme,
      textColor: textColor,
      navIconColor: navIconColor,
    );
  }
}
