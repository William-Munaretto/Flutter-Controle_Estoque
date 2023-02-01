import 'package:controle_estoque/models/cerveja.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await initDatabase();

  Future<Database> initDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'beer_stock.db');

    return await openDatabase(path, version: 2, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(cervejas);
  }

  String cervejas = '''
    CREATE TABLE cervejas(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome VARCHAR(255), 
      tipo VARCHAR(255),
      ibu INTEGER,
      descricacao VARCHAR(255)
    )''';

  Future<List<Cerveja>> listarCervejas() async {
    Database db = await instance.database;
    var cervejas = await db.query(
      'cervejas',
    );
    List<Cerveja> listaDeCervejas = cervejas.isNotEmpty
        ? cervejas.map((cerv) => Cerveja.fromMap(cerv)).toList()
        : [];
    return listaDeCervejas;
  }

  //adicionar Documento
  Future<void> addCerveja(Cerveja cerveja) async {
    Database db = await instance.database;
    await db.insert('cervejas', cerveja.toMap());
  }

  //remover documento
  Future<void> deleteCerveja(int id) async {
    Database db = await instance.database;
    await db.delete('cervejas', where: 'id = ?', whereArgs: [id]);
  }

  //editar documento
  Future<void> updateDocumento(Cerveja cerveja) async {
    Database db = await instance.database;
    await db.update('cervejas', cerveja.toMap(),
        where: 'id = ?', whereArgs: [cerveja.id]);
  }
}
