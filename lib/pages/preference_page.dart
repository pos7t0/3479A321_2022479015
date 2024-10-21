import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../models/app_data.dart';  // Importar AppData para usar el counter

class PreferencePage extends StatefulWidget {
  const PreferencePage({Key? key}) : super(key: key);

  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  String _userName = ''; // Estado del nombre de usuario

  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Cargar preferencias al iniciar la página
  }

  // Cargar las preferencias guardadas
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? ''; // Cargar el nombre
    });
  }

  // Guardar las preferencias
  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', _userName);
    await prefs.setInt('counter', Provider.of<AppData>(context, listen: false).counter); // Guardar el counter actual
  }

  // Actualizar el nombre de usuario
  void _updateUserName(String newName) {
    setState(() {
      _userName = newName;
    });
    _savePreferences();
  }

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context); // Acceder al counter desde Provider

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferencias'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Campo para editar el nombre de usuario
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nombre de usuario',
              ),
              initialValue: _userName,
              onChanged: _updateUserName,
            ),
            const SizedBox(height: 20),

            // Slider para el contador
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Valor del contador'),
                Slider(
                  value: appData.counter.toDouble(), // Valor del counter desde Provider
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: appData.counter.toString(),
                  onChanged: (double newValue) {
                    appData.updateCounter(newValue.toInt()); // Actualizar el counter desde Provider
                    _savePreferences(); // Guardar preferencias cuando cambie el slider
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}