import 'package:great_places/utils/constantes.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sql.dart';

class DbUtil {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      // Dando nome pro db e juntando com o dbpath
      path.join(dbPath, '${Constantes.tbName}.db'),
      // DDL do esquema do banco de dados
      onCreate: (db, version) {
        // Vai salvar só o path da imagem, pois ela tá persistida na pasta do projeto
        return db.execute(
            'CREATE TABLE ${Constantes.tbName} (id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng, REAL, adress TEXT)');
      },
      // Versão do banco de dados
      version: 1,
    );
  }

  static Future<List<Map<String, Object?>>> getData(String table) async {
    final db = await DbUtil.database();
    return db.query(table);
  }

  // Inserir na tabela do SQLite
  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbUtil.database();
    await db.insert(
      table,
      data,
      // O replace vai substituir o dado se eu passar algum ID que já existe
      // Pode usar outros algoritmos, como rollback ou error, ou ignore.
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
