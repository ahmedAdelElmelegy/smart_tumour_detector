import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield(
      {super.key,
      required this.hint,
      this.keyboardType = TextInputType.text,
      this.onFieldSubmitted,
      this.controller,
      this.validator});
  final String hint;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      textAlignVertical: TextAlignVertical.bottom,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 15),
          constraints: const BoxConstraints(maxHeight: 60),
          contentPadding: const EdgeInsets.only(top: 20, bottom: 20, left: 15),
          filled: true,
          fillColor: const Color.fromARGB(255, 225, 230, 243),
          hintStyle: const TextStyle(
            color: Color(0xff2260FF),
            fontSize: 20,
          ),
          hintText: hint,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}
