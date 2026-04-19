import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const String name = "/signup";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _formKey = GlobalKey<FormState>();

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [

                TextFormField(
                  controller: emailCtrl,
                  decoration: const InputDecoration(hintText: "Email"),
                ),

                const SizedBox(height: 10),

                TextFormField(
                  controller: firstNameCtrl,
                  decoration: const InputDecoration(hintText: "First Name"),
                ),

                const SizedBox(height: 10),

                TextFormField(
                  controller: lastNameCtrl,
                  decoration: const InputDecoration(hintText: "Last Name"),
                ),

                const SizedBox(height: 10),

                TextFormField(
                  controller: phoneCtrl,
                  decoration: const InputDecoration(hintText: "Phone"),
                ),

                const SizedBox(height: 10),

                TextFormField(
                  controller: passCtrl,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: "Password"),
                ),

                const SizedBox(height: 20),

                Consumer<AuthProvider>(
                  builder: (context, provider, _) {

                    if (provider.isLoading) {
                      return const CircularProgressIndicator();
                    }

                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {

                          final success =
                          await context.read<AuthProvider>().signup(
                            email: emailCtrl.text.trim(),
                            password: passCtrl.text.trim(),
                            firstName: firstNameCtrl.text.trim(),
                            lastName: lastNameCtrl.text.trim(),
                            phone: phoneCtrl.text.trim(),
                          );

                          if (success) {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.name);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Signup Failed"),
                              ),
                            );
                          }
                        },
                        child: const Text("Create Account"),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 16),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back to Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    phoneCtrl.dispose();
    super.dispose();
  }
}