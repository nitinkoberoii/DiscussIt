import 'package:discuss_it/core/common/loader.dart';
import 'package:discuss_it/core/constants/constants.dart';
import 'package:discuss_it/features/auth/controller/auth_controller.dart';
import 'package:discuss_it/features/auth/screens/signup_screen.dart';
import 'package:discuss_it/responsive/responsive.dart';
import 'package:discuss_it/theme/pallette.dart';
import 'package:discuss_it/widgets/custom_svg_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'logSign_screens/email_login.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).signInWithGoogle(context);
  }

  void useEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EmailUsernameLogin(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    final currentTheme = ref.watch(themeNotifierProvider);
    final isDarkTheme = currentTheme.brightness == Brightness.dark;
    const bool isFromLogin = true;

    return Scaffold(
      body: isLoading
          ? const Loader()
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 1),
                Column(
                  children: [
                    Center(
                      child: Image.asset(
                        Constants.logoPath,
                        height: 150,
                      ),
                    ),
                    const Text(
                      'Log in to DiscussIt',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 40),
                    // CustomSvgButton(
                    //   imagePath: 'assets/svgs/phone.svg',
                    //   text: 'Continue with phone number',
                    //   onTap: () {},
                    // ),
                    const SizedBox(height: 12),
                    Responsive(
                      child: CustomSvgButton(
                        imagePath: 'assets/svgs/google.svg',
                        text: 'Continue with Google',
                        onTap: () => signInWithGoogle(context, ref),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Responsive(
                      child: CustomSvgButton(
                        imagePath: 'assets/svgs/user.svg',
                        text: 'Use email or username',
                        onTap: () => useEmail(context),
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Continue as Guest',
                        style: TextStyle(fontSize: 18, color: Colors.orange),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Column(
                    children: [
                      const Text(
                        'By continuing, you agree to our User Agreement and acknowledge that you understand the Privacy Policy',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      const Divider(thickness: 2),
                      const SizedBox(height: 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account? '),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all(
                                const EdgeInsets.symmetric(horizontal: 15),
                              ),
                            ),
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            ),
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: isDarkTheme
                                    ? Colors.white
                                    : Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
