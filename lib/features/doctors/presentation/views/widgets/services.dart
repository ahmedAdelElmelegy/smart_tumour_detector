import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/core/utils/functions/servieces_func.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      "Dermato-Endocrinology",
      "Cosmetic Bioengineering",
      "Dermato-Genetics",
      "Solar Dermatology",
      "Dermato-Endocrinology",
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ...categories.map(
                  (category) => buildCategoryTile(category),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
