import 'package:discuss_it/theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int? maxLength;
  final int? maxLines;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLength,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        cursorColor: Colors.deepOrange,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Pallete.greyColor, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Pallete.greyColor, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        maxLength: maxLength,
        maxLines: maxLines,
      ),
    );
  }
}
