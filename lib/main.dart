import 'dart:ui';
import 'package:flutter/material.dart';

class Product {
  const Product({required this.imUr, required this.name, required this.cuan});
  final String imUr;
  final String name;
  final int cuan;
}

class Saucer {
  const Saucer ({required this.pro});
  final Product pro;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Image.asset("images/logo.png"),
              //child: Image.network("https://th.bing.com/th/id/OIP.rO_erAHn811Sm0TR4TohQgHaHa?pid=ImgDet&rs=1",

            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invent()),
                      );
                    },
                    child: const Text('Inventario'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      onPrimary: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 40),
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
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Surt()),
                  );
                },
                child: const Text('Surtir'),
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
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Visua()),
                  );
                },
                child: const Text('Consumo'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  onPrimary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 40),
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
                child: Text("General",
                      style: TextStyle(
                      fontSize: 20,),),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child:
                Text("Gastos",
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
                Product(imUr:'https://img2.freepng.es/20180511/zuq/kisspng-bun-hamburger-small-bread-bakery-stock-photography-5af57ff732a814.1235732815260385192075.jpg', name: 'Pan', cuan:5),
                Product(imUr:'https://bidea2.com/wp-content/uploads/2020/10/hamburguesa.png', name: 'Carne', cuan:8),
                Product(imUr:'https://www.pngmart.com/files/16/Butterhead-Green-Lettuce-PNG-Transparent-Image.png', name: 'Lechuga', cuan:3),
              ],
            ),
            Icon(Icons.work_off_outlined),
          ],
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
        title: Text("Surtir"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: ShoppingList(
          products: [
            Product(imUr:'https://img2.freepng.es/20180511/zuq/kisspng-bun-hamburger-small-bread-bakery-stock-photography-5af57ff732a814.1235732815260385192075.jpg', name: 'Pan', cuan:5),
            Product(imUr:'https://bidea2.com/wp-content/uploads/2020/10/hamburguesa.png', name: 'Carne', cuan:8),
            Product(imUr:'https://www.pngmart.com/files/16/Butterhead-Green-Lettuce-PNG-Transparent-Image.png', name: 'Lechuga', cuan:3),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
            //se agregarian directamente a la base de datos
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


class Visua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: ShoppingList(
          products: [
            //Se tomara directo de la base de datos
        Product(imUr:'https://img2.freepng.es/20180511/zuq/kisspng-bun-hamburger-small-bread-bakery-stock-photography-5af57ff732a814.1235732815260385192075.jpg', name: 'Pan', cuan:5),
        Product(imUr:'https://bidea2.com/wp-content/uploads/2020/10/hamburguesa.png', name: 'Carne', cuan:8),
        Product(imUr:'https://www.pngmart.com/files/16/Butterhead-Green-Lettuce-PNG-Transparent-Image.png', name: 'Lechuga', cuan:3),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //se quita directamente a la base de datos
        },
        child: const Icon(Icons.attach_money),
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
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundImage:
        NetworkImage(product.imUr),
        backgroundColor: Colors.transparent,
      ),
      title: Text(product.name,
        style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
      ),
      trailing: Text(product.cuan.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          backgroundColor: Colors.amber,
        ),
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
