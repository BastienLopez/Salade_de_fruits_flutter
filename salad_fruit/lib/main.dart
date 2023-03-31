import 'package:flutter/material.dart';

void main() {
  runApp(const SaladFruitApp());
}

class Fruit {
  final String name;
  final Color color;
  final double price;
  final String image

  Fruit(String name, Color color, double price) {
    this.name = name;
    this.color = color;
    this.price = price;
    this.image = image;
  }

  String getPriceFormatted() {
    return price.toStringAsFixed(2);
  }
}






class SaladFruitApp extends StatelessWidget {
  const SaladFruitApp({super.key});

  final List<Fruit> fruits = [
    Fruit("Pomme", Colors.red, 1, image: "images/pomme"),
    Fruit("Banane", Colors.yellow, 1, image: "images/banane.png"),
    Fruit("Orange", Colors.orange, 1, image: "images/orange.png"),
    Fruit("Ananas", Colors.yellow, 3, image: "images/ananas.png"),
    Fruit("Fraise", Colors.red, 1, image: "images/fraise.png"),
    Fruit("Melon", Colors.green, 2, image: "images/melon.png"),
    Fruit("Pasteque", Colors.red, 1, image: "images/pasteque.png"),
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

  int _currentPageIndex = 0;
  final List<Widget> _pages = [ FruitListScreen(), CartScreen() ];
  final PageController _pageController = PageController(initialPage: 0);

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
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Fruits"),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          children: [
            AllFruitsScreen(),
            CartScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPageIndex,
          onTap: (index) {
            setState(() {
              _currentPageIndex = index;
              _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: "Tous les fruits",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Panier",
            ),
          ],
        ),
      );
    }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruits'),
      ),
      body: PageView(
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Fruits disponibles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Mon panier',
          ),
        ],
      ),
    );
  }

  @override
  _FruitsMasterScreenState createState() => _FruitsMasterScreenState();
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


class FruitDetailsScreen extends StatelessWidget {
  final Fruit fruit;

  const FruitDetailsScreen({Key? key, required this.fruit}) : super(key: key);

  void _removeItem(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    cart.removeItem(fruit.id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${fruit.name} a été retiré du panier'),
        action: SnackBarAction(
          label: 'Annuler',
          onPressed: () {
            cart.addItem(fruit.id, fruit.name, fruit.price, fruit.image);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(fruit.name),),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: [
          FruitPreview(imageUrl: fruit.image),
          Expanded(
            child: Padding(padding: EdgeInsets.all(16),child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,children: [
                  Text(fruit.name,style: Theme.of(context).textTheme.headline6, ),
                  SizedBox(height: 16),
                  Text('${fruit.price.toStringAsFixed(2)} €', style: Theme.of(context).textTheme.subtitle1, ),
                  SizedBox(height: 16),
                  Text(fruit.description,style: Theme.of(context).textTheme.bodyText1, ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                final cart = Provider.of<Cart>(context, listen: false);
                cart.addItem(fruit.id, fruit.name, fruit.price, fruit.image);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${fruit.name} a été ajouté au panier'),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'Annuler',
                      onPressed: () {
                        cart.removeItem(fruit.id);
                      },
                    ),
                  ),
                );
              },
              child: Text('Ajouter au panier'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _removeItem(context);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}



class CartScreen extends StatelessWidget {
  final Cart cart;

  const CartScreen({Key? key, required this.cart}) : super(key: key);

  ListView.builder(
    itemCount: _cartItems.length,
    itemBuilder: (context, index) {
      final fruit = _cartItems[index];
      return ListTile(
        leading: FruitPreview(fruit: fruit),
        title: Text(fruit.name),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              _cartItems.remove(fruit);
            });
          },
        ),
      );
    },
  )


  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(item.fruit.image),
                    ),
                    title: Text(item.fruit.name),
                    subtitle: Text('${item.count} x ${item.fruit.price}€'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => cart.removeItem(item.fruit),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total: ${cart.totalPrice}€', style: TextStyle(fontSize: 24)),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Checkout'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
}