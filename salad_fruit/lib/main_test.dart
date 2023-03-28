import 'package:flutter/material.dart';

void main() {
  runApp(const SaladFruitApp());
}

class Fruit {
  final String name;
  final Color color;
  final double price;

  Fruit(String name, Color color, double price) {
    this.name = name;
    this.color = color;
    this.price = price;
  }

  String getPriceFormatted() {
    return price.toStringAsFixed(2);
  }
}






class SaladFruitApp extends StatelessWidget {
  const SaladFruitApp({super.key});

  final List<Fruit> fruits = [
    Fruit("Pomme", Colors.red, 1),
    Fruit("Banane", Colors.yellow, 1),
    Fruit("Orange", Colors.orange, 1),
    Fruit("Ananas", Colors.yellow, 3),
    Fruit("Fraise", Colors.red, 1),
    Fruit("Melon", Colors.green, 2),
    Fruit("Pasteque", Colors.red, 1),
    // Ajoutez autant d'éléments que nécessaire
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'salade de fruits',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FruitsMasterScreen(title: 'salade de fruits'),
    );
  }
}







class FruitsMasterScreen extends StatelessWidget {
  final List<Fruit> fruits;

  const FruitsMasterScreen({Key? key, required this.fruits}) : super(key: key);

  @override
  _FruitsMasterScreenState createState() => _FruitsMasterScreenState();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des fruits'),
      ),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(fruits[index].name),
            subtitle: Text(fruits[index].color.toString()),
          );
        },
      ),
    );
  }
}






class _FruitsMasterScreenState extends State<FruitsMasterScreen> {
  int _counter = 0;

  late List<Fruit> _fruits= [];

  double _cartAmount = 0.0;

  @override
  void initState() {
    super.initState();
    _fruits = widget.fruits;
  }

  void _onFruitTap(Fruit fruit) {
    // Code à exécuter lorsqu'un fruit est sélectionné
  }

  void _onFruitTap(Fruit fruit) {
    // Ajouter le fruit au panier
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total panier : <N> €'),
      ),
      body: ListView.builder(
        itemCount: _fruits.length,
        itemBuilder: (BuildContext context, int index) {
          final fruit = _fruits[index];
          return FruitPreview(
            fruit: fruit,
            onTap: _onFruitTap,
          );
        },
      ),
    );
  }


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the FruitsMasterScreen object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        onPressed:
          final newFruit = Fruit(
            name: 'Fruit ${_fruits.length + 1}',
            price: Random().nextDouble() * 10,
            color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1),
          );

          // Ajout du nouvel objet Fruit en première position de la liste _fruits
          setState(() {
            _fruits.insert(0, newFruit);
          });
        child: const Icon(Icons.add),
      ),
    );
  }

  void _updateCartAmount() {
  double total = 0.0;
  for (Fruit fruit in _cart) {
    total += fruit.price;
  }
  setState(() {
    _cartAmount = total;
  });
}
}

class FruitPreview extends StatelessWidget {
  final Fruit fruit;
  final Function(Fruit) onTap;
  List<Fruit> _cart = [];

  const FruitPreview({Key? key, required this.fruit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(fruit.name),
      tileColor: Color(int.parse('0xFF${fruit.color}', radix: 16)),
      onTap: () => onTap(fruit),
    );
  }
}