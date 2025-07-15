import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/core/widgets/custom_star.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/Proffesional_doctor.dart';

class ProffesionalDoctorandRating extends StatelessWidget {
  const ProffesionalDoctorandRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ProffesionalDoctor(),
        SizedBox(width: 44),
        CustomStar(),
      ],
    );
  }
}
