import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importar Provider
import '../models/app_data.dart'; // Importar AppData

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context, listen: false); // Acceder a AppData

    // Registrar la acción de acceso a la pantalla de detalles
    WidgetsBinding.instance.addPostFrameCallback((_) {
      appData.addAction('Acceso a la pantalla de detalles');  // Usar el nuevo método
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0), // Aumentar el padding alrededor del contenido del cuerpo
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Asegurar que los hijos estén centrados horizontalmente
            children: [
              const Text(
                'Al presionar la flecha hacia arriba aumenta el contador, al presionar la flecha hacia abajo disminuye y el otro botón reinicia el contador',
                textAlign: TextAlign.center, // Centrar el texto dentro de su propio contenedor
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 40), // Espacio entre el texto y el contador
              Text(
                'Valor actual del contador: ${appData.counter}', // Mostrar el valor del contador
                style: const TextStyle(fontSize: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}