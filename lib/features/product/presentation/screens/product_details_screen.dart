import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../../features/product/presentation/providers/product_provider.dart';
import '../../../../features/cart/presentation/providers/cart_provider.dart';
import '../../../../features/wishlist/presentation/providers/wishlist_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  static const String name = "/product-details";

  @override
  Widget build(BuildContext context) {
    final Map product =
    ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(product["title"] ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                product["image"] ?? "",
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                const Icon(Icons.image, size: 100),
              ),
            ),

            const SizedBox(height: 20),


            Text(
              product["title"] ?? "",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),


            Text(
              "\$${product["price"]}",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.themeColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),


            Text(product["description"] ?? ""),

            const Spacer(),

            Row(
              children: [


                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<CartProvider>()
                          .addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Added to cart"),
                        ),
                      );
                    },
                    child: const Text("Add to Cart"),
                  ),
                ),

                const SizedBox(width: 10),

                IconButton(
                  onPressed: () {
                    context
                        .read<WishlistProvider>()
                        .addToWishlist(product);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Added to wishlist"),
                      ),
                    );
                  },
                  icon: const Icon(Icons.favorite_border),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}