import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';  // Importar SharedPreferences
import 'detail_page.dart';  // Importar la página de Detalle
import 'about_page.dart';   // Importar la página Sobre
import 'auditoria_page.dart';  // Importar Auditoría
import 'preference_page.dart';  // Importar la pantalla de Preferencias

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _userName = '';  // Variable para almacenar el nombre de usuario
  int _counter = 0;  // Variable para almacenar el valor del contador

  @override
  void initState() {
    super.initState();
    _loadPreferences();  // Cargar preferencias al iniciar la pantalla
  }

  // Método para cargar las preferencias
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? '';  // Cargar nombre de usuario
      _counter = prefs.getInt('counter') ?? 0;  // Cargar valor del contador
      print('Counter value $_counter is loaded');
      print('Username value $_userName is loaded');
    });
  }

  // Definir el icono dependiendo de si el contador es múltiplo de 5
  Widget getIcon() {
    if (_counter % 5 == 0 && _counter != 0) {
      if ((_counter ~/ 5) % 2 == 0) {
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

  @override
  Widget build(BuildContext context) {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Contador',)),
                );
              },
            ),
            ListTile(
              title: const Text('Detalle'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Sobre'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Auditoría'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AuditoriaPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Preferencias'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PreferencePage()),
                ).then((_) {
                  _loadPreferences();  // Volver a cargar las preferencias al regresar
                });
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (_userName.isNotEmpty)
              Text(
                'Hola $_userName',  // Mostrar mensaje de bienvenida si hay nombre
                style: const TextStyle(fontSize: 30),
              ),
            Text(
              '$_counter',  // Mostrar el valor del contador
              style: const TextStyle(fontSize: 40),
            ),
            getIcon(),  // Mostrar el icono alternante si es múltiplo de 5
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (_counter > 0) _counter--;
                    });
                  },
                  icon: const Icon(Icons.arrow_downward),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _counter = 0;
                    });
                  },
                  icon: const Icon(Icons.refresh),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _counter++;
                    });
                  },
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