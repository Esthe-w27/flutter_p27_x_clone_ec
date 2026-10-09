import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _prefs = SharedPreferencesAsync();

  bool _modeSombre = true;

  @override
  void initState() {
    super.initState();
    _chargerMode();
  }

  Future<void> _chargerMode() async {
    final valeur = await _prefs.getBool('modeSombre');
    if (!mounted) return;
    setState(() => _modeSombre = valeur ?? true);
  }

  Future<void> _changerMode(bool valeur) async {
    setState(() => _modeSombre = valeur);
    await _prefs.setBool('modeSombre', valeur);
  }

  @override
  Widget build(BuildContext context) {
    final fond = _modeSombre ? Colors.black : Colors.white;
    final texte = _modeSombre ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: fond,
      appBar: AppBar(
        backgroundColor: fond,
        foregroundColor: texte,
        title: const Text('Paramètres'),
      ),
      body: SwitchListTile(
        title: Text(
          'Mode sombre',
          style: TextStyle(color: texte, fontSize: 18),
        ),
        value: _modeSombre,
        onChanged: _changerMode,
      ),
    );
  }
}
