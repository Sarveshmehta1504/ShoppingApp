import 'package:flutter/material.dart';
import '../model/Cart.dart';
class CartScreen extends StatefulWidget {
  final Cart cart;
  const CartScreen({required this.cart, Key? key}) :
        super(key: key);
  @override
  State<CartScreen> createState() =>
      _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {
  Cart get cart => widget.cart;
  var total_count;
  var text ="Get Item Count";
  var total_amount;
  var amount_text ="Get Total Amount";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Cart'),
    ),
    body: ListView.builder(
    itemCount: cart.items.length,
    itemBuilder: (context, index) {
    final product = cart.items[index];
    return ListTile(
    trailing: IconButton(
    icon: const Icon(Icons.remove_circle),
    onPressed: () {
    setState(() {
    cart.removeFromCart(product);
    });
    },
    ),
    title: Text(product.name),
      subtitle: Text('\$${product.price}'),
    );
    },
    ),
      floatingActionButton: Column(
          children: [
          ElevatedButton(onPressed: () {setState(()
    {
    total_count = cart.items.length;
    text = "Item Count: $total_count";
    }); },
      child: Text("$text"),
    ),
    Container(height: 10,),
    ElevatedButton(onPressed: () {
    total_amount = 0;
    var p;
    for(int i=0; i<cart.items.length ; i++){
    p = cart.items[i];
    var cost = p.price;
    total_amount += cost;
    }
    setState(() {
    total_amount;
    amount_text = "Total amount: $total_amount";
    });
    },
      child: Text("$amount_text"),
    ),
          ], mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
      ),
    );
  }
}