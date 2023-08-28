import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'Pages/Splash.dart';
import 'firebase_options.dart';
import 'Providers/ThemeProvider.dart';

Future main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        final provider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'incubateQR',
          themeMode: provider.themeMode,
          theme: CustomTheme.fromContext(context).lightTheme,
          darkTheme: CustomTheme.fromContext(context).darkTheme,
          home: const Splash(),
        );
      },
    );
  }
}
