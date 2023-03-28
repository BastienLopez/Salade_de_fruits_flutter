import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(SaladFruitApp());
}

class Fruit {
  String name;
  Color color;
  double price;

  Fruit({
    required this.name,
    required this.color,
    required this.price,
  });
}

class SaladFruitApp extends StatelessWidget {
  final List<Fruit> fruits = [
    Fruit(name: 'Pomme', color: Colors.red, price: 1.99),
    Fruit(name: 'Banane', color: Colors.yellow, price: 1),
    Fruit(name: 'Orange', color: Colors.orange, price: 2.49),
    Fruit(name: 'Ananas', color: Colors.yellow, price: 3.89),
    Fruit(name: 'Fraise', color: Colors.red, price: 0.89),
    Fruit(name: 'Melon', color: Colors.green, price: 2),
    Fruit(name: 'Pasteque', color: Colors.red, price: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salade de fruits',
      home: FruitsMasterScreen(fruits: fruits),
    );
  }
}

class FruitsMasterScreen extends StatefulWidget {
  final List<Fruit> fruits;

  FruitsMasterScreen({required this.fruits});

  @override
  _FruitsMasterScreenState createState() => _FruitsMasterScreenState();
}

class _FruitsMasterScreenState extends State<FruitsMasterScreen> {
  List<Fruit> _fruits = [];
  double _cartAmount = 0.0;

  @override
  void initState() {
    super.initState();
    _fruits = widget.fruits;
    _updateCartAmount();
  }

  void _updateCartAmount() {
    double amount = 0.0;
    for (Fruit fruit in _fruits) {
      amount += fruit.price;
    }
    setState(() {
      _cartAmount = amount;
    });
  }

  void _onFruitTap(Fruit fruit) {
    setState(() {
      _fruits.remove(fruit);
      _updateCartAmount();
    });
  }

  void _addRandomFruit() {
    setState(() {
      final random = Random();
      final name = 'Fruit ${_fruits.length + 1}';
      final color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1.0,
      );
      final price = double.parse((random.nextDouble() * 10).toStringAsFixed(2));
      _fruits.insert(0, Fruit(name: name, color: color, price: price));
      _updateCartAmount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total panier : ${_cartAmount.toStringAsFixed(2)} €'),
      ),
      body: ListView.builder(
        itemCount: _fruits.length,
        itemBuilder: (BuildContext context, int index) {
          return FruitPreview(
            fruit: _fruits[index],
            onFruitTap: _onFruitTap,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRandomFruit,
        child: Icon(Icons.add),
      ),
    );
  }
}

class FruitPreview extends StatelessWidget {
  final Fruit fruit;
  final void Function(Fruit) onFruitTap;

  FruitPreview({required this.fruit, required this.onFruitTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onFruitTap(fruit),
      title: Text(fruit.name),
      tileColor: fruit.color,
    );
  }
}
