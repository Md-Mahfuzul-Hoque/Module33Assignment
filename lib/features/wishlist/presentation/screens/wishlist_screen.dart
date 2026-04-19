import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/wishlist_provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.watch<WishlistProvider>().items;

    return Scaffold(
      appBar: AppBar(title: const Text("Wishlist")),
      body: items.isEmpty
          ? const Center(child: Text("Wishlist empty"))
          : ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return ListTile(
            leading: Image.network(item["image"] ?? ""),
            title: Text(item["title"] ?? ""),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context.read<WishlistProvider>()
                    .removeFromWishlist(index);
              },
            ),
          );
        },
      ),
    );
  }
}