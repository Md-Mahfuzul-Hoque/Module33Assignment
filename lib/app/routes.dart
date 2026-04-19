import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/signup_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import '../features/product/presentation/screens/product_details_screen.dart';
import '../features/shared/presentation/screens/main_nav_holder_screen.dart';

class Routes {
  static const String login = "/login";
  static const String signup = "/signup";
  static const String home = "/home";
  static const String profile = "/profile";
  static const String productDetails = "/product-details";
  static const String main = "/main";

  static Map<String, WidgetBuilder> routes = {
    login: (_) => const LoginScreen(),
    signup: (_) => const SignupScreen(),
    home: (_) => const HomeScreen(),
    profile: (_) => const ProfileScreen(),
    productDetails: (_) => const ProductDetailsScreen(),
    main: (_) => const MainNavHolderScreen(),
  };
}