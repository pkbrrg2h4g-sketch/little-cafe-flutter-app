import 'package:flutter/material.dart';
import 'models/product.dart';
import 'pages/cart_page.dart';
import 'pages/catalog_page.dart';
import 'pages/home_page.dart';
import 'services/product_service.dart';

void main() {
  runApp(const LittleCafeApp());
}

class LittleCafeApp extends StatelessWidget {
  const LittleCafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Little Cafe',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F0EE),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB66B6B),
          primary: const Color(0xFFB66B6B),
          secondary: const Color(0xFF7A4B3A),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Color(0xFF4D2F2A),
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final Map<int, int> _cart = {};
  final List<Product> _products = ProductService.getProducts();

  void addToCart(Product product) {
    setState(() {
      _cart[product.id] = (_cart[product.id] ?? 0) + 1;
    });
  }

  void increaseCart(Product product) {
    setState(() {
      _cart[product.id] = (_cart[product.id] ?? 0) + 1;
    });
  }

  void decreaseCart(Product product) {
    setState(() {
      if ((_cart[product.id] ?? 0) <= 1) {
        _cart.remove(product.id);
      } else {
        _cart[product.id] = (_cart[product.id] ?? 0) - 1;
      }
    });
  }

  void removeFromCart(Product product) {
    setState(() {
      _cart.remove(product.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(onAddToCart: addToCart),
      CatalogPage(onAddToCart: addToCart),
      CartPage(
        cartItems: _cart,
        products: _products,
        onIncrease: increaseCart,
        onDecrease: decreaseCart,
        onRemove: removeFromCart,
      ),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFB66B6B),
        unselectedItemColor: const Color(0xFF7B5A52),
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Katalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Sepet',
          ),
        ],
      ),
    );
  }
}
