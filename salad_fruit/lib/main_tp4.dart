import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Isolate Demo';

    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({super.key, required this.photos});

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}

class Fruit {
  String name;
  Color color;
  double price;

  Fruit({
    required this.name,
    required this.color,
    required this.price,

    "fruit_id": 1,
    "name": "Pomme",
    "description": "Pomme pas ouf",
    "image_url": "images/apple.png",
    "price": 0.00058,
    "stock": 8000000000,
    "origin_country": "CHINA",
    "harvest_date": "2086-09-01",
  });
}

class FruitsApp extends StatefulWidget {
  @override
  _FruitsAppState createState() => _FruitsAppState();
}

class _FruitsAppState extends State<FruitsApp> {
dependencies:
  http: <latest_version>
Future<http.Response> fetchPhotos(http.Client client) async {
  return client.get(Uri.parse('https://fruits.shrp.dev/items/fruits'));
}
  var url = Uri.https('https://fruits.shrp.dev/items/fruits', 'whatsit/create');
  var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  print(await http.read(Uri.https('https://fruits.shrp.dev/items/fruits', 'foobar.txt')));

  double _cartAmount = 0.0;

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
    return MaterialApp(
      title: 'Fruits App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Total panier : ${_cartAmount.toStringAsFixed(2)} €'),
        ),
        body: ListView.builder(
          itemCount: _fruits.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () => _onFruitTap(_fruits[index]),
              title: Text(_fruits[index].name),
              tileColor: _fruits[index].color,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addRandomFruit,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

class Fruit {
  String name;
  Color color;
  double price;
}

class SaladFruitApp extends StatelessWidget {
  

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
