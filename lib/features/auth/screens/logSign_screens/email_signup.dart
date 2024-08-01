import 'package:discuss_it/core/common/loader.dart';
import 'package:discuss_it/features/auth/controller/auth_controller.dart';
import 'package:discuss_it/responsive/responsive.dart';
import 'package:discuss_it/theme/pallette.dart';
import 'package:discuss_it/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'email_login.dart';

class EmailSignup extends ConsumerWidget {
  const EmailSignup({super.key});

  void signUpWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
    String username,
    WidgetRef ref,
  ) {
    ref
        .read(authControllerProvider.notifier)
        .signUpWithEmailAndPassword(context, email, password, username);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _usernameController = TextEditingController();
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
                builder: (context) => const EmailUsernameLogin(),
              ),
            ),
            child: Text(
              'Log in',
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
                        'Hi new friend, welcome to DiscussIt',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        'Enter your email to get started',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Responsive(
                        child: CustomTextfield(
                          hintText: 'Email',
                          controller: _emailController,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Responsive(
                        child: CustomTextfield(
                          hintText: 'Name',
                          controller: _usernameController,
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
                          onPressed: () => signUpWithEmailAndPassword(
                            context,
                            _emailController.text,
                            _passwordController.text,
                            _usernameController.text,
                            ref,
                          ),
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
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
