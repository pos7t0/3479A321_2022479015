import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart'; // Importar Provider
import '../models/app_data.dart'; // Importar AppData

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context, listen: false); // Acceder a AppData

    // Registrar la acción de acceso a la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      appData.addAction('Acceso a información sobre el Desarrollador');  // Usar el nuevo método
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                SvgPicture.asset(
                  'assets/icon/food_mango.svg',
                  semanticsLabel: 'user Logo',
                  width: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Hola, soy Rodrigo, estudiante de Ingeniería en desarrollo de videojuegos y realidad virtual, para esta ocasión tuve que hacer este código para dispositivos móviles.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}