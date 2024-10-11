import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';  // Importar el package provider
import 'pages/MyHomeState.dart';
import 'pages/app_data.dart';  // Importar la clase AppData

void main() {
  runApp(
    ChangeNotifierProvider<AppData>(  // Envolver la aplicación con ChangeNotifierProvider
      create: (context) => AppData(),  // Crear una instancia de AppData
      child: const MyApp(),
    ),
  );
}

var logger = Logger(
  printer: PrettyPrinter(),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        fontFamily: 'Create',
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ejemplo'),  // Tu página inicial
    );
  }
}