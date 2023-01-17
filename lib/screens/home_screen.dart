import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_preferences/shared/preferences.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final String language = Preferences.language == 1 ? 'Dart' : 'TypeScript';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('isDarkMode: ${Preferences.isDarkMode}'),
          const Divider(),
          Text('Language: $language'),
          const Divider(),
          Text('Developer Tool: ${Preferences.tool}'),
          const Divider(),
        ],
      ),
      drawer: const SideMenu(),
    );
  }
}