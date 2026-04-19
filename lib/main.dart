import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app_theme.dart';
import 'app/routes.dart';

/// AUTH
import 'features/auth/presentation/providers/auth_provider.dart';
import 'features/auth/presentation/providers/profile_provider.dart';

/// NAV
import 'features/shared/presentation/providers/main_nav_provider.dart';

/// HOME DATA
import 'features/category/presentation/providers/category_provider.dart';
import 'features/product/presentation/providers/product_provider.dart';

/// CART + WISHLIST
import 'features/cart/presentation/providers/cart_provider.dart';
import 'features/wishlist/presentation/providers/wishlist_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        /// 🔐 AUTH
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),

        /// 🔄 NAVIGATION
        ChangeNotifierProvider(create: (_) => MainNavProvider()),

        /// 🏠 HOME DATA
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),

        /// 🛒 CART + ❤️ WISHLIST
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        /// 🎨 THEME
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,

        /// 🚀 ROUTES
        initialRoute: Routes.login,
        routes: Routes.routes,
      ),
    );
  }
}