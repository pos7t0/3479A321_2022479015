import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';  // Importar el package provider
import 'pages/MyHomeState.dart';
import 'models/app_data.dart';  // Importar la clase AppData

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Asegurar la inicialización
  runApp(
    ChangeNotifierProvider<AppData>(
      create: (context) => AppData(),
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
      home: const MyHomePage(title: 'Contador'),  // Tu página inicial
    );
  }
}