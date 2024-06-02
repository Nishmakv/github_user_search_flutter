import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? trailingWidget;
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1f2a48),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.white,
        ),
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          border: InputBorder.none,
          prefixIcon: prefixIcon,
          suffixIcon: trailingWidget,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xffd2dae5),
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
