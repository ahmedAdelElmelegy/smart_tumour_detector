import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
  });
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xffCAD6FF))),
        onPressed: () {},
        icon: Icon(
          icon,
          size: 40,
          color: const Color.fromARGB(255, 18, 78, 127),
        ));
  }
}