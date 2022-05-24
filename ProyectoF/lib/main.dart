import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//CLASE PRODUCTO
class Product {
  const Product({required this.imUr, required this.name, required this.cuan, required this.cant, required this.lim});
  final String imUr;
  final String name;
  final int cuan;
  final int cant;
  final int lim;
}

//CLASE PLATILLO
class Saucer {
  const Saucer ({ required this.imUr, required this.name, required this.cuan, required this.pro,});
  final String imUr;
  final String name;
  final int cuan;
  final List<Product> pro;
}



//MAIN CORRE APP
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color1 = Color(0xffEDB506);
    const color2 = Color(0xffffffff);
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



class Invent extends StatelessWidget {
  @override
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

        body: const TabBarView(
          children: [
            ShoppingList(
              products: [
                Product(imUr:'', name: 'Pan', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Carne Arrachera', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Carne Tradicional', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Lechuga', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Lechuga', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Jitomate', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Cebolla', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Queso amarillo', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'BBQ', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Piña', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Refrescos', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Aguas', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Catsup', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Mayonesa', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Mostaza', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Chile', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Pepinillo', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Sevilletas', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Papas', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Salchichas', cuan:0, cant: 0, lim: 2),
                Product(imUr:'', name: 'Pan p/hot dog', cuan:0, cant: 0, lim: 2),
              ],
            ),
            ShoppingList(
              products: [
                //if(cant <= lim)
              ],
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            //agregar ingrediente
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
      body: const Center(
        child: SalesList(
          saucers: [
            //leer de la base de datos
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //agregar venta
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}





class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({
    required this.product,
  }) : super(key: ObjectKey(product));

  final Product product;

  @override
  Widget build(BuildContext context) {
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
            NetworkImage(product.imUr),
            backgroundColor: Colors.transparent,
          ),

          Text(product.name,
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),)
                  )
              ),

              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(product.cuan.toString(),
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

class ShoppingList extends StatefulWidget {
  const ShoppingList({required this.products, Key? key}) : super(key: key);

  final List<Product> products;

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
          );
        }).toList(),
      ),
    );
  }
}





class SalesListItem extends StatelessWidget {
  SalesListItem({
    required this.saucer,
  }) : super(key: ObjectKey(saucer));

  final Saucer saucer;

  @override
  Widget build(BuildContext context) {
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
            NetworkImage(saucer.imUr),
            backgroundColor: Colors.transparent,
          ),

          Text(saucer.name,
            style: TextStyle(
              color: Colors.amber,
              fontSize: 20,
            ),
          ),

          Row(
            children: [

              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(saucer.cuan.toString(),
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

class SalesList extends StatefulWidget {
  const SalesList({required this.saucers, Key? key}) : super(key: key);

  final List<Saucer> saucers;

  @override
  _SalesListState createState() => _SalesListState();
}

class _SalesListState extends State<SalesList> {
  final _salesCart = <Saucer>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        children: widget.saucers.map((Saucer saucer) {
          return SalesListItem(
            saucer: saucer,
          );
        }).toList(),
      ),
    );
  }
}