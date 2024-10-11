//import 'package:flutter/material.dart';
import 'package:ejem/pages/auditoria_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:logger/logger.dart';
import 'about_page.dart';
import 'detail_page.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
                Navigator.pop(context);
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
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _decrementCounter,
                  icon: const Icon(Icons.arrow_downward),
                ),
                IconButton(
                  onPressed: _resetCounter,
                  icon: const Icon(Icons.refresh),
                ),
                IconButton(
                  onPressed: _incrementCounter,
                  icon: const Icon(Icons.arrow_upward),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      logger.d("setState: Counter incrementado a $_counter");
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
      logger.d("setState: Counter decrementado a $_counter");
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      logger.d("setState: Counter reiniciado a $_counter");
    });
  }
}

// Nueva pantalla de Auditoría




