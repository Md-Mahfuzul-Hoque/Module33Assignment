import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/controllers/auth_controller.dart';
import '../../../../features/auth/presentation/providers/profile_provider.dart';
import '../../../auth/presentation/screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String name = "/profile";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProfileProvider>().getProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () async {
              await AuthController.logout();

              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginScreen.name,
                    (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Consumer<ProfileProvider>(
        builder: (context, provider, _) {

          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.profile == null) {
            return const Center(child: Text("No Data"));
          }

          final user = provider.profile!;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: ${user["name"] ?? ""}"),
                const SizedBox(height: 8),
                Text("Email: ${user["email"] ?? ""}"),
              ],
            ),
          );
        },
      ),
    );
  }
}