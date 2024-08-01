import 'package:discuss_it/core/common/loader.dart';
import 'package:discuss_it/features/auth/controller/auth_controller.dart';
import 'package:discuss_it/features/home/screens/home_screen.dart';
import 'package:discuss_it/responsive/responsive.dart';
import 'package:discuss_it/theme/pallette.dart';
import 'package:discuss_it/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import 'email_signup.dart';

class EmailUsernameLogin extends ConsumerWidget {
  const EmailUsernameLogin({super.key});

  void signInWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
    WidgetRef ref,
  ) {
    ref
        .read(authControllerProvider.notifier)
        .signInWithEmailAndPassword(context, email, password);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final isLoading = ref.watch(authControllerProvider);
    final currentTheme = ref.watch(themeNotifierProvider);
    final isDarkTheme = currentTheme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        title: Image.asset(
          'assets/images/discussItLogo.png',
          width: 85,
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const EmailSignup(),
              ),
            ),
            child: Text(
              'Sign up',
              style: TextStyle(
                  color: isDarkTheme ? Colors.white38 : Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Loader()
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        'Enter your login information',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Responsive(
                        child: CustomTextfield(
                          hintText: 'Email or Username',
                          controller: _emailController,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Responsive(
                        child: CustomTextfield(
                          hintText: 'Password',
                          controller: _passwordController,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Responsive(
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(color: Colors.deepOrange),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23),
                      child: Text(
                        'By continuing, you agree to our User Agreement and acknowledge that you understand the Privacy Policy',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Responsive(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.deepOrange),
                          ),
                          onPressed: () => signInWithEmailAndPassword(
                            context,
                            _emailController.text,
                            _passwordController.text,
                            ref,
                          ),
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
    );
  }
}