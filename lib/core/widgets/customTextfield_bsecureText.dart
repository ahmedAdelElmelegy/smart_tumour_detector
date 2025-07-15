import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/features/auth/data/models/form_validators_class.dart';

class CustomTextfieldWithObsecureText extends StatefulWidget {
  const CustomTextfieldWithObsecureText({
    super.key,
    required this.hint,
    this.controller,
    this.onFieldSubmitted,
  });
  final String hint;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  @override
  State<CustomTextfieldWithObsecureText> createState() =>
      _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfieldWithObsecureText> {
  bool obscureText = true;

  void togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: (value) => FormValidators.validatePassword(value),
      textAlignVertical: TextAlignVertical.bottom,
      obscureText: obscureText,
      obscuringCharacter: '*',
      decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 15),
          contentPadding: const EdgeInsets.only(top: 20, bottom: 20, left: 15),
          constraints: const BoxConstraints(maxHeight: 60),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: togglePasswordVisibility,
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 225, 230, 243),
          hintStyle: const TextStyle(
            color: Color(0xff2260FF),
            fontSize: 20,
          ),
          hintText: widget.hint,
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
