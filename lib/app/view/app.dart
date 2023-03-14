import 'package:calculator/calculator/view/calculator_page.dart';
import 'package:calculator/counter/counter.dart';
import 'package:calculator/l10n/l10n.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        scaffoldBackgroundColor: Colors.black26,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
          backgroundColor: Colors.blue,
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const CalculatorPage(),
    );
  }
}
