import 'package:flutter/foundation.dart';
import 'databasehelper.dart';
import 'auditoria.dart';

class AppData extends ChangeNotifier {
  int _counter = 0;
  List<String> _actions = [];
  final DatabaseHelper _dbHelper = DatabaseHelper();

  // Getters
  int get counter => _counter;
  List<String> get actions => _actions;

  // Método para incrementar el contador
  void incrementCounter() {
    _counter++;
    _addAction('Incremented to $_counter');
    notifyListeners();
  }

  // Método para decrementar el contador
  void decrementCounter() {
    if (_counter > 0) {
      _counter--;
      _addAction('Decremented to $_counter');
      notifyListeners();
    }
  }

  // Método para resetear el contador
  void resetCounter() {
    _counter = 0;
    _addAction('Reset to $_counter');
    notifyListeners();
  }

  // Método para actualizar el contador a un valor específico
  void updateCounter(int newValue) {
    _counter = newValue;
    _addAction('Updated to $_counter');
    notifyListeners();
  }

  // Método para registrar las acciones de navegación
  void addAction(String action) {
    _actions.add(action);
    notifyListeners();
  }

  // Método privado para registrar la acción en la base de datos
  Future<void> _addAction(String actionName) async {
    _actions.add(actionName);
    await _dbHelper.insertAuditoria(Auditoria(nombreAccion: actionName)); // Usar nombreAccion
  }

  // Método para cargar acciones desde la base de datos
  Future<void> loadActions() async {
    List<Auditoria> auditoriaList = await _dbHelper.getAuditoriaList();
    _actions = auditoriaList.map((e) => e.nombreAccion).toList(); // Usar nombreAccion
    notifyListeners();
  }
}