import 'package:flutter/material.dart';
import 'package:project_flutter_inventario/models/alimento.dart';
import 'package:project_flutter_inventario/models/ingredient.dart';
import 'package:project_flutter_inventario/models/ingrediente_alimento.dart';
import 'package:sqflite/sqflite.dart';
import 'package:project_flutter_inventario/db/operation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Hola Mundo :D'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    Operation.insertIngredient(Ingredient(id: 1, name: 'Carne', amount: 11, image: '', limit: 12));
    Operation.insertAlimento(Alimento(id: 1, name: 'Hamburguesa', image: ''));
    Operation.insertIngredienteAlimento(AlimentoIngrediente(id: 1, idAlimento: 1, idIngrediente: 1, amount: 1));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _MyList2()
    );
  }
}


//Ingredientes

class _MyList extends StatefulWidget {
  @override
  State<_MyList> createState() => _MyListState();
}

class _MyListState extends State<_MyList> {
  List<Ingredient> ingredients = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ingredients.length,
      itemBuilder: (_, i) => _createItem(i),
    );
  }

  _loadData() async {
    List<Ingredient> auxIngredient = await Operation.ingredients();
    setState(() {
      ingredients = auxIngredient;
    });
  }

  _createItem(int i){
    return ListTile(
      title: Text(ingredients[i].name),
    );
  }
}



//Alimentos
class _MyList1 extends StatefulWidget {
  @override
  State<_MyList1> createState() => _MyListState1();
}

class _MyListState1 extends State<_MyList1> {
  List<Alimento> alimentos = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: alimentos.length,
      itemBuilder: (_, i) => _createItem(i),
    );
  }

  _loadData() async {
    List<Alimento> auxIngredient = await Operation.alimentos();
    setState(() {
      alimentos = auxIngredient;
    });
  }

  _createItem(int i){
    return ListTile(
      title: Text(alimentos[i].name),
    );
  }
}


// Relación
class _MyList2 extends StatefulWidget {
  @override
  State<_MyList2> createState() => _MyListState2();
}

class _MyListState2 extends State<_MyList2> {
  List<AlimentoIngrediente> alimentosIngredientes = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: alimentosIngredientes.length,
      itemBuilder: (_, i) => _createItem(i),
    );
  }

  _loadData() async {
    List<AlimentoIngrediente> auxIngredient = await Operation.alimentoIngredientes();
    setState(() {
      alimentosIngredientes = auxIngredient;
    });
  }

  _createItem(int i){
    return ListTile(
      title: Text(alimentosIngredientes[i].id.toString() + '__' + alimentosIngredientes[i].idIngrediente.toString() + '__' + alimentosIngredientes[i].idAlimento.toString()),
    );
  }
}
