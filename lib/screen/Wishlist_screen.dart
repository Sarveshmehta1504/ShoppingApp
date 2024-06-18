import 'package:flutter/material.dart';
import '../../model/Wishlist.dart';
import '../../model/Product.dart';

class WishlistScreen extends StatelessWidget {
  final Wishlist wishlist;
  WishlistScreen({required this.wishlist});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: wishlist.items.length,
        itemBuilder: (context, index) {
          final product = wishlist.items[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
          );
        },
      ),
    );
  }
}