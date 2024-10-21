import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/auditoria.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  // Inicialización de la base de datos
  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'auditoria.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  // Método para crear la tabla auditoria
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE auditoria (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombreAccion TEXT
      )
    ''');
  }

  // Método para insertar en la tabla auditoria
  Future<int> insertAuditoria(Auditoria auditoria) async {
    Database db = await database;
    return await db.insert('auditoria', auditoria.toMap());
  }

  // Método para recuperar la lista de auditorías
  Future<List<Auditoria>> getAuditoriaList() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('auditoria');
    return List.generate(maps.length, (i) {
      return Auditoria.fromMap(maps[i]);
    });
  }

  // Método para borrar la base de datos (solo para desarrollo)
  Future<void> deleteDatabase() async {
  String path = join(await getDatabasesPath(), 'auditoria.db');
  await delete(path); // Cambia 'deleteDatabase' por 'delete'
}

  delete(String path) {}
}