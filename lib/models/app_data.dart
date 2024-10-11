import 'package:flutter/foundation.dart';

class AppData extends ChangeNotifier {
  int _counter = 0;
  List<String> _actions = [];

  // Getter para obtener el contador
  int get counter => _counter;

  // Getter para obtener las acciones
  List<String> get actions => _actions;

  // Método para incrementar el contador
  void incrementCounter() {
    _counter++;
    _actions.add('Incremented to $_counter');
    notifyListeners();  // Notifica a todos los listeners sobre los cambios
  }

  // Método para decrementar el contador
  void decrementCounter() {
    if (_counter > 0) {
      _counter--;
      _actions.add('Decremented to $_counter');
      notifyListeners();
    }
  }

  // Método para resetear el contador
  void resetCounter() {
    _counter = 0;
    _actions.add('Reset to $_counter');
    notifyListeners();
  }

  // **Nuevo método para registrar las acciones de navegación**
  void addAction(String action) {
    _actions.add(action);
    notifyListeners();
  }
}