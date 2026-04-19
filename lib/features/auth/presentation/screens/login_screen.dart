import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../../../../app/validators.dart';
import '../../../../features/shared/presentation/widgets/snack_bar_message.dart';
import '../providers/auth_provider.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String name = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 60),

                Text(
                  "Login",
                  style: context.textTheme.headlineSmall,
                ),

                const SizedBox(height: 8),

                Text(
                  "Enter your email & password",
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 24),


                TextFormField(
                  controller: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                  validator: Validators.validateEmail,
                ),

                const SizedBox(height: 12),


                TextFormField(
                  controller: passCtrl,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                  validator: Validators.validatePassword,
                ),

                const SizedBox(height: 20),


                Consumer<AuthProvider>(
                  builder: (context, authProvider, _) {

                    if (authProvider.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {

                          if (_formKey.currentState!.validate()) {

                            final success =
                            await context.read<AuthProvider>().login(
                              emailCtrl.text.trim(),
                              passCtrl.text.trim(),
                            );

                            if (success) {

                              Navigator.pushReplacementNamed(
                                context,
                                "/main",
                              );
                            } else {
                              showSnackBarMessage(
                                context,
                                "Login Failed",
                              );
                            }
                          }
                        },
                        child: const Text("Login"),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 16),


                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        SignupScreen.name,
                      );
                    },
                    child: const Text("Create Account"),
                  ),
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
    super.dispose();
  }
}