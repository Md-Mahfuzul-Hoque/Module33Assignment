import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../features/auth/presentation/providers/auth_provider.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import 'app_theme.dart';
import 'routes.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: LoginScreen.name, //
        routes: Routes.routes,
      ),
    );
  }
}