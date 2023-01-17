import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_preferences/providers/theme_provider.dart';
import 'package:persistent_preferences/shared/preferences.dart';
import 'package:persistent_preferences/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const String routeName = 'settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text (
                'Settings', 
                style: TextStyle(
                  fontSize: 35, 
                  fontWeight: FontWeight.w400)
              ),
              const Divider(),
              SwitchListTile(
                title: const Text('DarkMode'),
                value: Preferences.isDarkMode, 
                onChanged: (value) {
                  Preferences.isDarkMode = value;
                  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                  value ? themeProvider.setDarkMode() : themeProvider.setLightMode();
                  setState(() {});
                }
              ),
              const Divider(),
              RadioListTile<int>(
                value: 1, 
                title: const Text('Dart'),
                groupValue: Preferences.language, 
                onChanged: (value) {
                  Preferences.language = value ?? 1;
                  setState(() { });
                }
              ),
              const Divider(),
              RadioListTile<int>(
                value: 2, 
                title: const Text('TypeScript'),
                groupValue: Preferences.language, 
                onChanged: (value) {
                  Preferences.language = value ?? 2;
                  setState(() { });
                }
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onChanged: (value) {
                    Preferences.tool = value;
                    setState(() { });
                  },
                  initialValue: Preferences.tool,
                  decoration: const InputDecoration(
                    labelText: 'Dev tool',
                    helperText: 'Language tool name'
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: const SideMenu(),
    );
  }
}