class Auditoria {
  final int? id; // Asumiendo que id puede ser nulo
  final String nombreAccion;

  Auditoria({this.id, required this.nombreAccion});

  // Convertir Auditoria a Map para insertar en la base de datos
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombreAccion': nombreAccion,
    };
  }

  // Crear una instancia de Auditoria desde un Map
  factory Auditoria.fromMap(Map<String, dynamic> map) {
    return Auditoria(
      id: map['id'],
      nombreAccion: map['nombreAccion'],
    );
  }
}