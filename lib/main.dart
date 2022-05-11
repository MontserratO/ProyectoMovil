import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


//CLASE PRODUCTO
class Product {
  const Product({required this.imUr, required this.name, required this.cant, required this.cuan});
  final String imUr;
  final String name;
  final String cuan;
  final String cant;
}

//??????????????
class Saucer {
  const Saucer ({required this.pro});
  final Product pro;
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
    return MaterialApp(
      title: 'Inventario',
      theme: ThemeData(
        canvasColor: color1,
        primarySwatch: Colors.deepOrange
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
            backgroundImage: AssetImage("images/logo.png"),
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
                child: const Text('Visualizar'),
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
                Product(imUr:'https://img2.freepng.es/20180511/zuq/kisspng-bun-hamburger-small-bread-bakery-stock-photography-5af57ff732a814.1235732815260385192075.jpg', name: 'Pan', cuan:'0', cant: '0'),
                Product(imUr:'https://bidea2.com/wp-content/uploads/2020/10/hamburguesa.png', name: 'Carne Arrachera', cuan:'0', cant: '0'),
                Product(imUr:'https://www.pngmart.com/files/16/Butterhead-Green-Lettuce-PNG-Transparent-Image.png', name: 'Carne Tradicional', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'Lechuga', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'Lechuga', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'Jitomate', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'Cebolla', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'Queso amarillo', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'BBQ', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'Piña', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'Refrescos', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'Aguas', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'Catsup', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'Mayonesa', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'Mostaza', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'Chile', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'Pepinillo', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'Sevilletas', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'Papas', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'Salchichas', cuan:'0', cant: '0'),
                Product(imUr:'', name: 'Pan p/hot dog', cuan:'0', cant: '0'),
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
      body: const Center(
        child: ShoppingList(
          products: [
        Product(imUr:'https://img2.freepng.es/20180511/zuq/kisspng-bun-hamburger-small-bread-bakery-stock-photography-5af57ff732a814.1235732815260385192075.jpg', name: 'Pan', cuan:'0', cant: '0'),
        Product(imUr:'https://bidea2.com/wp-content/uploads/2020/10/hamburguesa.png', name: 'Carne Arrachera', cuan:'0', cant: '0'),
        Product(imUr:'https://www.pngmart.com/files/16/Butterhead-Green-Lettuce-PNG-Transparent-Image.png', name: 'Carne Tradicional', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Lechuga', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Lechuga', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Jitomate', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Cebolla', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Queso amarillo', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'BBQ', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Piña', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Refrescos', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Aguas', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Catsup', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Mayonesa', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Mostaza', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Chile', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Pepinillo', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Sevilletas', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Papas', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Salchichas', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Pan p/hot dog', cuan:'0', cant: '0'),
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
        title: Text("Visualizar"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: const Center(
        child: ShoppingList(
          products: [
        Product(imUr:'https://img2.freepng.es/20180511/zuq/kisspng-bun-hamburger-small-bread-bakery-stock-photography-5af57ff732a814.1235732815260385192075.jpg', name: 'Pan', cuan:'0', cant: '0'),
        Product(imUr:'https://bidea2.com/wp-content/uploads/2020/10/hamburguesa.png', name: 'Carne Arrachera', cuan:'0', cant: '0'),
        Product(imUr:'https://www.pngmart.com/files/16/Butterhead-Green-Lettuce-PNG-Transparent-Image.png', name: 'Carne Tradicional', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Lechuga', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Lechuga', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Jitomate', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Cebolla', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Queso amarillo', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'BBQ', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Piña', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Refrescos', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Aguas', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Catsup', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Mayonesa', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Mostaza', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Chile', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Pepinillo', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Sevilletas', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Papas', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Salchichas', cuan:'0', cant: '0'),
        Product(imUr:'', name: 'Pan p/hot dog', cuan:'0', cant: '0'),
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
      subtitle: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: product.cant,
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
