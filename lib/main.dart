import 'package:flutter/material.dart';
import 'package:persistent_preferences/providers/theme_provider.dart';
import 'package:persistent_preferences/screens/screens.dart';
import 'package:persistent_preferences/shared/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider(
        isDarkMode: Preferences.isDarkMode)
      )
    ],
    child: const PersistentPreferences(),
  ));
} 

class PersistentPreferences extends StatelessWidget {
  const PersistentPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Settings Preferences APP',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
      },
    );
  }
}