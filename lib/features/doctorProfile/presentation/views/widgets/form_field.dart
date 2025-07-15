import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  String selectedGender = 'Female';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText("Full Name"),
        customTextField("Jane Doe", nameController),
        const SizedBox(height: 10),
        labelText("Age"),
        customTextField("30", ageController,
            keyboardType: TextInputType.number),
        const SizedBox(height: 10),
        labelText("Gender"),
        const SizedBox(height: 10),
        Row(
          children: ["Male", "Female", "Other"].map((gender) {
            final isSelected = selectedGender == gender;
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ChoiceChip(
                label: Text(gender),
                selected: isSelected,
                onSelected: (_) {
                  setState(() {
                    selectedGender = gender;
                  });
                },
                selectedColor: ConstantColor.kprimaryBlue,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : ConstantColor.kprimaryBlue,
                  fontWeight: FontWeight.w500,
                ),
                backgroundColor: Colors.transparent,
                side: BorderSide(color: ConstantColor.kprimaryBlue),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 30),
        Divider(color: ConstantColor.kprimaryLightBlue, thickness: 1),
        const SizedBox(height: 20),
        labelText("Describe your problem"),
        const SizedBox(height: 10),
        Container(
          height: 120,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: ConstantColor.kprimaryLightBlue,
            border: Border.all(color: ConstantColor.kprimaryBlue),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const TextField(
            maxLines: null,
            expands: true,
            decoration: InputDecoration.collapsed(
              hintText: 'Enter Your Problem Here...',
            ),
          ),
        ),
      ],
    );
  }
}

////////
Widget labelText(String text) => Text(
      text,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );

Widget customTextField(String hint, TextEditingController controller,
    {TextInputType keyboardType = TextInputType.text}) {
  return Container(
    decoration: BoxDecoration(
      color: ConstantColor.kprimaryLightBlue,
      borderRadius: BorderRadius.circular(20),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(
          color: ConstantColor.kprimaryBlue, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
      ),
    ),
  );
}
