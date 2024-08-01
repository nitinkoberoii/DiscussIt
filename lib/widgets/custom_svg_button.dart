import 'package:discuss_it/theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgButton extends ConsumerWidget {
  final String imagePath;
  final String text;
  final VoidCallback onTap;

  const CustomSvgButton({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeNotifierProvider);
    final isDarkTheme = currentTheme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 50,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: isDarkTheme ? Pallete.blackColor : Pallete.greyColor,
          border: Border.all(
            color: Colors.white60,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              imagePath,
              width: 20,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(width: 1),
          ],
        ),
      ),
    );
  }
}
