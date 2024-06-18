import 'package:flutter/material.dart';
import 'model/Product.dart';
import 'model/Cart.dart';
import 'model/Wishlist.dart';
import 'model/Order.dart';
import 'screen/cart_screen.dart';
import 'screen/wishlist_screen.dart';
import 'screen/orders_screen.dart';

void main() {
  runApp(const ShoppingDemoApp());
}
class ShoppingDemoApp extends StatelessWidget {
  const ShoppingDemoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping Demo',
        theme: ThemeData(
        scaffoldBackgroundColor:
        const Color(0xffe9ea9c), // Set your background color here
    ),
    home: ProductListScreen(),
    );
  }
}
class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(id: '1', name: 'Product 1', price: 30),
    Product(id: '2', name: 'Product 2', price: 50),
    Product(id: '3', name: 'Product 3', price: 20),
  ];
  final Cart cart = Cart();
  final Wishlist wishlist = Wishlist();
  final Order order = Order();
  ProductListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        title: const Text('Products'),
    backgroundColor: Colors.amber,
    actions: [
    IconButton(
    icon: const Icon(Icons.shopping_cart),
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context)
    => CartScreen(cart: cart)),
    );
    },
    ),
    IconButton(
    icon: const Icon(Icons.favorite),
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    WishlistScreen(wishlist: wishlist)),
    );
    },
    ),
    IconButton(
    icon: const Icon(Icons.list),
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    OrderScreen(order: order)),
    );
    },
    ),
    ],
    ),
    body: ListView.builder(
    itemCount: products.length,
    itemBuilder: (context, index) {
    final product = products[index];
    return Container(
    color: Colors.amber[100],
    child: ListTile(
    title: Text(product.name),
    subtitle: Text('Rs. ${product.price}'),
    trailing: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
    IconButton(
    icon: const
    Icon(Icons.add_shopping_cart),
    onPressed: () {
    cart.addToCart(product);
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content:
    Text('${product.name} added to cart')),
    );
    },
    ),
    IconButton(
    icon: const
    Icon(Icons.favorite_border),
    onPressed: () {
    wishlist.addToWishlist(product);
    },
    ),
    IconButton(
    icon: const Icon(Icons.list),
    onPressed: () {
      order.placeOrder(product);
    },
    ),
      IconButton(
        icon:
        Icon(Icons.remove_shopping_cart),
        onPressed: () {
          cart.removeFromCart(product);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                Text('${product.name} removed from cart')),
          );
        },
      ),
    ],
    ),
    ),
    );
    },
    ),
    );
  }
}