import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cartItems;

    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: cart.isEmpty
          ? const Center(child: Text("Cart is empty"))
          : ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final item = cart[index];

          return ListTile(
            leading: Image.network(item["image"] ?? ""),
            title: Text(item["title"] ?? ""),
            subtitle: Text("\$${item["price"]}"),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context.read<CartProvider>().removeFromCart(index);
              },
            ),
          );
        },
      ),
    );
  }
}