import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Asegúrate de tener esta dependencia
import 'package:provider/provider.dart';  // Importar Provider
import '../models/app_data.dart';  // Importar AppData
import 'detail_page.dart';
import 'about_page.dart';
import 'auditoria_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context); // Ahora el widget escuchará los cambios

    // Registrar la acción de acceso a la pantalla principal
    WidgetsBinding.instance.addPostFrameCallback((_) {
      appData.addAction('Acceso a la pantalla principal');  // Usar el nuevo método
    });

    // Definir el icono dependiendo de si el contador es múltiplo de 5
    Widget getIcon() {
      if (appData.counter % 5 == 0 && appData.counter != 0) {
        if ((appData.counter ~/ 5) % 2 == 0) {
          // Alternar: si es múltiplo de 2, mostrar "ganar"
          return SvgPicture.asset(
            'assets/icon/win.svg',
            semanticsLabel: 'Win Icon',
            width: 100,
          );
        } else {
          // Alternar: si es impar, mostrar "perder"
          return SvgPicture.asset(
            'assets/icon/game_over.svg',
            semanticsLabel: 'Game Over Icon',
            width: 100,
          );
        } 
      } else {
        // No mostrar icono si no es múltiplo de 5
        return SvgPicture.asset(
            'assets/icon/food_mango.svg',
            semanticsLabel: 'Game Over Icon',
            width: 100,
          );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menú de Navegación'),
            ),
            ListTile(
              title: const Text('Contador'),
              onTap: () {
                appData.addAction("go to contador page");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Detalle'),
              onTap: () {
                appData.addAction("go to detail page");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Sobre'),
              onTap: () {
                appData.addAction("go to sobre page");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Auditoría'),
              onTap: () {
                appData.addAction("go to auditoría page");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AuditoriaPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '${appData.counter}',  // Mostrar el valor del contador desde el Provider
              style: const TextStyle(fontSize: 40),
            ),
            getIcon(),  // Mostrar el icono alternante si es múltiplo de 5
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: appData.decrementCounter,  // Disminuir contador desde el Provider
                  icon: const Icon(Icons.arrow_downward),
                ),
                IconButton(
                  onPressed: appData.resetCounter,  // Resetear contador desde el Provider
                  icon: const Icon(Icons.refresh),
                ),
                IconButton(
                  onPressed: appData.incrementCounter,  // Aumentar contador desde el Provider
                  icon: const Icon(Icons.arrow_upward),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}