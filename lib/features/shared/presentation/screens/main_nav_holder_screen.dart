import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../features/home/presentation/screens/home_screen.dart';
import '../../../../features/cart/presentation/screens/cart_screen.dart';
import '../../../../features/wishlist/presentation/screens/wishlist_screen.dart';
import '../../../../features/profile/presentation/screens/profile_screen.dart';
import '../providers/main_nav_provider.dart';
import '../../../../features/cart/presentation/providers/cart_provider.dart';

class MainNavHolderScreen extends StatelessWidget {
  const MainNavHolderScreen({super.key});

  static const String name = "/main";

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<MainNavProvider>();
    final cartCount = context.watch<CartProvider>().cartItems.length;

    final screens = [
      const HomeScreen(),
      const WishlistScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[navProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navProvider.currentIndex,
        onTap: (index) {
          context.read<MainNavProvider>().changeIndex(index);
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                if (cartCount > 0)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        cartCount.toString(),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            label: "Cart",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}