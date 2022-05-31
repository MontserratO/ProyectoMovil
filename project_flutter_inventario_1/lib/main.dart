import 'package:flutter/material.dart';
import 'package:project_flutter_inventario/models/alimento.dart';
import 'package:project_flutter_inventario/models/ingredient.dart';
import 'package:project_flutter_inventario/models/ingrediente_alimento.dart';
import 'package:project_flutter_inventario/db/operation.dart';

import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';

//MAIN CORRE APP
void main() {
  runApp(const MyApp());
}

void _InsertInitialData(){
  // ALIMENTOS
  Operation.insertAlimento(
      Alimento(
          id: 0,
          name: "Taco al pastor",
          ventas: 0,
          image: "https://unamglobal.unam.mx/wp-content/uploads/2018/09/Tacos-al-Pastor.jpg"
      )
  );
  Operation.insertAlimento(
      Alimento(
          id: 1,
          name: "Hamburguesa",
          ventas: 0,
          image: "https://www.cocinavital.mx/wp-content/uploads/2018/06/hamburguesa-al-pastor.jpg"
      )
  );

  // INGREDIENTES
  Operation.insertIngredient(
    Ingredient(
        id: 0 ,
        name: "tortilla",
        amount: 400,
        image: "https://www.hogarmania.com/archivos/201405/1456-tortillas-trigo-mexicanas-xl-1280x720x80xX.jpg",
        amount_min: 300
    )
  );
  Operation.insertIngredient(
      Ingredient(
          id: 1 ,
          name: "pastor",
          amount: 15000,
          image: "https://www.lasalsapremier.com/wp-content/uploads/2019/09/kilo-1.jpg",
          amount_min: 10000
      )
  );
  Operation.insertIngredient(
      Ingredient(
          id: 2 ,
          name: "Pan Hamburguesa",
          amount: 40,
          image: "https://www.heb.com.mx/media/catalog/product/cache/9f5ec31302878493d9ed0ac40a398e12/2/5/259523_image.jpg",
          amount_min: 50
      )
  );
  Operation.insertIngredient(
      Ingredient(
          id: 3 ,
          name: "Carne",
          amount: 40,
          image: "https://www.cardamomo.news/__export/1607982061138/sites/debate/img/2020/12/14/cxmo_hacer_carne_para_hamburguesas_en_dos_pasosx_sin_que_se_deshaga_crop1607981887959.jpeg_1753094345.jpeg",
          amount_min: 50
      )
  );
  Operation.insertIngredient(
      Ingredient(
          id: 4 ,
          name: "Lechuga",
          amount: 10000,
          image: "https://croper-production.s3.amazonaws.com/product_provider_files/files/000/011/153/original/lechuga-batavia-agroreza.webp",
          amount_min: 15000
      )
  );

  // RELACIONES
  Operation.insertIngredienteAlimento(
      AlimentoIngrediente(
          id: 0,
          idAlimento: 0,
          idIngrediente: 0,
          amount: 2
      )
  );
  Operation.insertIngredienteAlimento(
      AlimentoIngrediente(
          id: 1,
          idAlimento: 0,
          idIngrediente: 1,
          amount: 150
      )
  );
  Operation.insertIngredienteAlimento(
      AlimentoIngrediente(
          id: 2,
          idAlimento: 1,
          idIngrediente: 2,
          amount: 1
      )
  );
  Operation.insertIngredienteAlimento(
      AlimentoIngrediente(
          id: 3,
          idAlimento: 1,
          idIngrediente: 3,
          amount: 1
      )
  );
  Operation.insertIngredienteAlimento(
      AlimentoIngrediente(
          id: 4,
          idAlimento: 1,
          idIngrediente: 4,
          amount: 100
      )
  );

}

///////////////////////

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    const color1 = Color(0xffEDB506);
    const color2 = Color(0xffffffff);
    _InsertInitialData();
    return MaterialApp(
      title: 'Inventario',
      theme: ThemeData(
        canvasColor: Colors.white,
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage("images/logo2.jpg"),
            ),


            Padding(
              padding: EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Invent()),
                  );
                },
                child: const Text('Ingredientes'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  onPrimary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Surt()),
                  );
                },
                child: const Text('Alimentos'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  onPrimary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

//////////

class Invent extends StatelessWidget {
  @override


  createAlertDialog(BuildContext context) {

    TextEditingController controller = TextEditingController();
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    TextEditingController controller4 = TextEditingController();



    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("ID del ingrediente: "),
                  TextField(
                    controller: controller,
                  ),
                  Text("Nombre: "),
                  TextField(
                    controller: controller1,
                  ),
                  Text("Cantidad existente: "),
                  TextField(
                    controller: controller2,
                  ),
                  Text("URL de la imagen: "),
                  TextField(
                    controller: controller3,
                  ),
                  Text("limite: "),
                  TextField(
                    controller: controller4,
                  ),
                ],
              ),
            ),

            actions: <Widget>[
              MaterialButton(elevation: 5.0,
                child: Text('Guardar'),
                onPressed: () {
                  Operation.insertIngredient(Ingredient(id: int.parse(controller.text), name: controller1.text, amount: int.parse(controller2.text), image: controller3.text, amount_min: int.parse(controller4.text)));
                  controller1.text = '';
                  controller2.text = '';
                  controller3.text = '';
                  controller4.text = '';

                  Navigator.of(context).pop(controller.text.toString());
                },
              )
            ],
          );
        });
  }


  Widget build(BuildContext context) {


    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Surtir",
                  style: TextStyle(
                    fontSize: 20,),),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child:
                Text("⚠",
                  style: TextStyle(
                    fontSize: 20,),),
              ),
            ],
          ),
          title: Text("Inventario"),
          backgroundColor: Colors.amber,
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            _MyList(),
            _MyList1(),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            createAlertDialog(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class Surt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ventas"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: _MyList2(),
      ),
    );
  }
}


/////////

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

    TextEditingController controller = TextEditingController();
    int amount = ingredients[i].amount;

    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage:
            NetworkImage(ingredients[i].image),
            backgroundColor: Colors.transparent,
          ),

          Text(ingredients[i].name,
            style: TextStyle(
              color: Colors.amber,
              fontSize: 20,
            ),
          ),

          Row(
            children: [
              Container(
                  width: 50.0,
                  child: TextField(
                      controller: controller,
                      onEditingComplete: (){
                        Operation.updateIngredient(Ingredient(id: ingredients[i].id, name: ingredients[i].name, amount: int.parse(controller.text), image: ingredients[i].image, amount_min: ingredients[i].amount_min));
                        controller.text = '';
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Invent()),
                        );
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      )
                  )
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(amount.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _MyList1 extends StatefulWidget {
  @override
  State<_MyList1> createState() => _MyListState1();
}

class _MyListState1 extends State<_MyList1> {
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

    TextEditingController controller = TextEditingController();
    int amount = ingredients[i].amount;

    return ingredients[i].amount < ingredients[i].amount_min ? Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.amber),
          borderRadius: BorderRadius.circular(10),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage:
            NetworkImage(ingredients[i].image),
            backgroundColor: Colors.transparent,
          ),

          Text(ingredients[i].name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.amber,
              fontSize: 20,
            ),
          ),

          Row(
            children: [
              Container(
                  width: 50.0,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(amount.toString(),
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          )
        ],
      )
    ) : SizedBox.shrink();
  }
}


//Alimentos
class _MyList2 extends StatefulWidget {
  @override
  State<_MyList2> createState() => _MyListState2();
}

class _MyListState2 extends State<_MyList2> {
  List<Alimento> alimentos = [];
  List<AlimentoIngrediente> alimentoIngrediente = [];
  List<Ingredient> ingredientes = [];

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
    List<Alimento> auxAlimentos = await Operation.alimentos();
    List<AlimentoIngrediente> auxAlimentoIngredientes = await Operation.alimentoIngredientes();
    List<Ingredient> auxIngredientes = await Operation.ingredients();

    setState(() {
      alimentos = auxAlimentos;
      alimentoIngrediente = auxAlimentoIngredientes;
      ingredientes = auxIngredientes;
    });
  }

  _createItem(int i){
    TextEditingController controller = TextEditingController();
    int ventas = alimentos[i].ventas;

    List<AlimentoIngrediente> alimentoIngredienteRel = [];
    List<Ingredient> ingredienteRel = [];

    for(int j=0; j<alimentoIngrediente.length; j++){
      if(alimentoIngrediente[j].idAlimento == alimentos[i].id){
        alimentoIngredienteRel.add(alimentoIngrediente[j]);
      }
    }


    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage:
            NetworkImage(alimentos[i].image),
            backgroundColor: Colors.transparent,
          ),

          Text(alimentos[i].name,
            style: TextStyle(
              color: Colors.amber,
              fontSize: 20,
            ),
          ),

          Row(
            children: [
              Container(
                  width: 50.0,
                  child: TextField(
                      controller: controller,
                      onEditingComplete: (){
                        Operation.updateAlimento(Alimento(id: alimentos[i].id, name: alimentos[i].name, ventas: ventas + int.parse(controller.text), image: alimentos[i].image ));
                        for(var n in alimentoIngredienteRel){
                          Operation.venta(
                              Alimento(
                                  id: alimentos[i].id,
                                  name: alimentos[i].name,
                                  image: alimentos[i].image,
                                  ventas: int.parse(controller.text)
                              ),
                              Ingredient(
                                  id: n.idIngrediente,
                                  name: ingredientes[n.idIngrediente].name,
                                  amount: ingredientes[n.idIngrediente].amount,
                                  image: ingredientes[n.idIngrediente].image,
                                  amount_min: ingredientes[n.idIngrediente].amount_min
                              ),
                              AlimentoIngrediente(
                                  id: n.id,
                                  idAlimento: n.idAlimento,
                                  idIngrediente: n.idIngrediente,
                                  amount: n.amount)
                          );
                        }
                        controller.text = '';
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                            MaterialPageRoute(builder: (context) => Surt()),
                        );
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      )
                  )
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(ventas.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

