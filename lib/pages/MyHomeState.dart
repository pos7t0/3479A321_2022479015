import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  // initState: Se llama cuando el widget es insertado por primera vez
  @override
  void initState() {
    super.initState();
    logger.i("initState: Widget insertado en el árbol");
    print("initState: Widget insertado en el árbol");
  }

  // didChangeDependencies: Se llama cuando las dependencias cambian
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    logger.i("didChangeDependencies: Dependencias cambiaron");
    print("didChangeDependencies: Dependencias cambiaron");
  }

  // build: El método build es el que dibuja la interfaz
  @override
  Widget build(BuildContext context) {
    logger.i("build: Construyendo la interfaz de MyHomePage");
    print("build: Construyendo la interfaz de MyHomePage");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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

  // setState: Cambia el estado del widget
  void _incrementCounter() {
    setState(() {
      _counter++;
      logger.d("setState: Counter incrementado a $_counter");
      print("setState: Counter incrementado a $_counter");
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
      logger.d("setState: Counter decrementado a $_counter");
      print("setState: Counter decrementado a $_counter");
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      logger.d("setState: Counter reiniciado a $_counter");
      print("setState: Counter reiniciado a $_counter");
    });
  }

  // didUpdateWidget: Se llama cuando el widget se actualiza con nuevas propiedades
  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    logger.i("didUpdateWidget: Widget actualizado");
    print("didUpdateWidget: Widget actualizado");
  }

  // deactivate: Llamado cuando el widget se quita temporalmente del árbol
  @override
  void deactivate() {
    super.deactivate();
    logger.w("deactivate: Widget removido del árbol temporalmente");
    print("deactivate: Widget removido del árbol temporalmente");
  }

  // dispose: Se llama cuando el widget es removido permanentemente del árbol
  @override
  void dispose() {
    logger.e("dispose: Widget eliminado permanentemente");
    print("dispose: Widget eliminado permanentemente");
    super.dispose();
  }

  // reassemble: Llamado durante hot reload
  @override
  void reassemble() {
    super.reassemble();
    logger.i("reassemble: App reconstruida durante hot reload");
    print("reassemble: App reconstruida durante hot reload");
  }
}