import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const FruitsApp()); // Il manquait ce widget pour que votre application fonctionne
}

class Fruit {
  final String name;
  final String color;
  final double price;
  final int fruitId;
  final String description;
  final String imageUrl;
  final int stock;
  final String originCountry;
  final String harvestDate;

  Fruit({
    required this.name,
    required this.color,
    required this.price,
    required this.fruitId,
    required this.description,
    required this.imageUrl,
    required this.stock,
    required this.originCountry,
    required this.harvestDate,
  });
}

class FruitsApp extends StatefulWidget {
  const FruitsApp({Key? key}) : super(key: key);

  @override
  _FruitsAppState createState() => _FruitsAppState();
}

class _FruitsAppState extends State<FruitsApp> {
  int _cartAmount = 0;

  List<Fruit> _fruits = [
    Fruit(
      fruitId: 1,
      name: 'Ananas pourri',
      color: 'Orange',
      price: 2.5,
      description: 'Ananas pourri',
      imageUrl: 'images/ananas.png',
      stock: 50,
      originCountry: 'Russie',
      harvestDate: '2086-09-01',
    ),
    Fruit(
      fruitId: 2,
      name: 'Banane de qualité inférieures',
      color: 'Jaune',
      price: 1,
      description: 'Banane de qualité inférieures',
      imageUrl: 'images/banane.png',
      stock: 25855,
      originCountry: 'BRESIL',
      harvestDate: '2086-07-01',
    ),
    Fruit(
      fruitId: 3,
      name: 'citron pabo',
      color: 'Jaune',
      price: 1,
      description: 'citron pabo',
      imageUrl: 'images/citron.png',
      stock: 4000,
      originCountry: 'ESPAGNE',
      harvestDate: '2086-08-01',
    ),
    Fruit(
      fruitId: 1,
      name: 'cassis pas ouf',
      color: 'Rouge',
      price: 0.58,
      description: 'cassis pas ouf',
      imageUrl: 'images/cassis.png',
      stock: 474700,
      originCountry: 'CHINA',
      harvestDate: '2086-09-01',
    ),
    Fruit(
      fruitId: 2,
      name: 'bonne mangue a deguster',
      color: 'Orange',
      price: 1.25,
      description: 'mangue de bonne a deguster',
      imageUrl: 'images/mangue.png',
      stock: 400000,
      originCountry: 'BRESIL',
      harvestDate: '2086-07-01',
    ),
    Fruit(
      fruitId: 3,
      name: 'mure chaude /u',
      color: 'Rouge',
      price: 0.12,
      description: 'mure chaude /u',
      imageUrl: 'images/mure.png',
      stock: 4100,
      originCountry: 'ESPAGNE',
      harvestDate: '2086-08-01',
    ),
  ];

  void _updateCartAmount() {
    setState(() {
      _cartAmount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fruits'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _fruits.length,
                itemBuilder: (BuildContext context, int index) {
                  final fruit = _fruits[index];
                  return ListTile(
                    leading: Image.asset(fruit.imageUrl),
                    title: Text(fruit.name),
                    subtitle: Text('${fruit.price}€'),
                    trailing: IconButton(
                      icon: const Icon(Icons.add_shopping_cart),
                      onPressed: _updateCartAmount,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Text('$_cartAmount fruit(s) ajouté(s) au panier'),
          ],
        ),
      ),
    );
  }
}