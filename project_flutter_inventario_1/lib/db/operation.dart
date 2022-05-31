
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:project_flutter_inventario/models/ingredient.dart';
import 'package:project_flutter_inventario/models/alimento.dart';
import 'package:project_flutter_inventario/models/ingrediente_alimento.dart';

class Operation{

  static void _createDb(Database db){

      db.execute('''CREATE TABLE ingredientes(
                          id INTEGER PRIMARY KEY AUTOINCREMENT,
                          name TEXT NOT NULL,
                          amount INTEGER NOT NULL,
                          image TEXT,
                          amount_min INTEGER NOT NULL);''');

        db.execute('''CREATE TABLE alimentos(
                          id INTEGER PRIMARY KEY AUTOINCREMENT,
                          name TEXT NOT NULL,
                          image TEXT,
                          ventas INTEGER NOT NULL );''');

        db.execute('''CREATE TABLE ingredientes_alimentos(
                          id INTEGER PRIMARY KEY AUTOINCREMENT,
                          idIngrediente INT NOT NULL ,
                          idAlimento INT NOT NULL,
                          amount INT,
                          FOREIGN KEY(idIngrediente) REFERENCES ingredientes(id),
                          FOREIGN KEY(idAlimento) REFERENCES alimentos(id));)''');


  }

  static Future<Database> _openDB() async{
    return openDatabase(
      join(await getDatabasesPath(), 'database.db'),
      onCreate: (db, version){
          return _createDb(db);
        },
        version: 2,
    );
  }


  //CRUD INGREDIENTS
  static Future<void> insertIngredient(Ingredient ingredient) async{
    final Database db = await _openDB();

    await db.insert(
      'ingredientes',
      ingredient.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteIngredient(Ingredient ingredient) async{
    final Database db = await _openDB();

    await db.delete(
      'ingredientes',
      where: 'id = ?',
      whereArgs: [ingredient.id]
    );
  }

  static Future<void> updateIngredient(Ingredient ingredient) async{
    final Database db = await _openDB();

    await db.update(
        'ingredientes',
        ingredient.toMap(),
        where: 'id = ?',
        whereArgs: [ingredient.id]
    );
  }

  static Future<List<Ingredient>> ingredients() async{
    final Database db = await _openDB();
    final List<Map<String, dynamic>> ingredientsMap = await db.query('ingredientes');

    // for(var n in ingredientsMap){
    //   print("___" + n['name']);
    // }

    return List.generate(
        ingredientsMap.length,
            (i) => Ingredient(
                id: ingredientsMap[i]['id'],
                name: ingredientsMap[i]['name'],
                amount: ingredientsMap[i]['amount'],
                image: ingredientsMap[i]['image'],
                amount_min: ingredientsMap[i]['amount_min']
            ));
  }

  // CRUD ALIMENTOS

  static Future<void> insertAlimento(Alimento alimento) async{
    final Database db = await _openDB();

    await db.insert(
      'alimentos',
      alimento.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteAlimento(Alimento alimento) async{
    final Database db = await _openDB();

    await db.delete(
        'alimentos',
        where: 'id = ?',
        whereArgs: [alimento.id]
    );
  }

  static Future<void> updateAlimento(Alimento alimento) async{
    final Database db = await _openDB();

    await db.update(
        'alimentos',
        alimento.toMap(),
        where: 'id = ?',
        whereArgs: [alimento.id]
    );
  }


  static Future<List<Alimento>> alimentos() async{
    final Database db = await _openDB();
    final List<Map<String, dynamic>> alimentosMap = await db.query('alimentos');

    // for(var n in alimentosMap){
    //   print("___" + n['name']);
    // }
    return List.generate(
        alimentosMap.length,
            (i) => Alimento(
            id: alimentosMap[i]['id'],
            name: alimentosMap[i]['name'],
            image: alimentosMap[i]['image'],
            ventas: alimentosMap[i]['ventas']
        ));
  }

  // CRUD REFERENCIA

  static Future<void> insertIngredienteAlimento(AlimentoIngrediente alimentoIngrediente) async{
    final Database db = await _openDB();

    await db.insert(
      'ingredientes_alimentos',
       alimentoIngrediente.toMap(),
       conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteIngredienteAlimento(AlimentoIngrediente alimentoIngrediente) async{
    final Database db = await _openDB();

    await db.delete(
        'ingredientes_alimentos',
        where: 'id = ?',
        whereArgs: [alimentoIngrediente.id]
    );
  }

  static Future<void> updateIngredienteAlimento(AlimentoIngrediente alimentoIngrediente) async{
    final Database db = await _openDB();

    await db.update(
        'ingredientes_alimentos',
        alimentoIngrediente.toMap(),
        where: 'idAlimento = ? AND idIngrediente = ?',
        whereArgs: [alimentoIngrediente.idAlimento, alimentoIngrediente.idIngrediente],
    );
  }

  static Future<List<AlimentoIngrediente>> alimentoIngredientes() async{
    final Database db = await _openDB();
    final List<Map<String, dynamic>> alimentosIngredienteMap = await db.query('ingredientes_alimentos');

    // for(var n in alimentosIngredienteMap){
    //   print("___" + n['id'].toString() + "___" + n['idIngrediente'].toString() + "___" + n['idAlimento'].toString());
    // }

    return List.generate(
        alimentosIngredienteMap.length,
            (i) => AlimentoIngrediente(
              id: alimentosIngredienteMap[i]['id'],
              idIngrediente: alimentosIngredienteMap[i]['idIngrediente'],
              idAlimento: alimentosIngredienteMap[i]['idAlimento'],
              amount: alimentosIngredienteMap[i]['amount'],
        ));
  }

  static Future<void> venta(Alimento alimento, Ingredient ingredient, AlimentoIngrediente relacion) async {
    final Database db = await _openDB();
    Ingredient newIngredient = Ingredient(id: ingredient.id, name: ingredient.name, amount: ingredient.amount - alimento.ventas * relacion.amount , image: ingredient.image, amount_min: ingredient.amount_min);
    await db.update(
        'ingredientes',
        newIngredient.toMap(),
        where: 'id = ?',
        whereArgs: [ingredient.id]
    );
  }
}