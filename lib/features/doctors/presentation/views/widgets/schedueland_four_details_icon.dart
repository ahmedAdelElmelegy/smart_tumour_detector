import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/custom_sortby_icons.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/doctor_info_schudele.dart';

class ScheduelandFourDetailsIcon extends StatelessWidget {
  const ScheduelandFourDetailsIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const DoctorInfoScheduel(),
        const SizedBox(width: 85),
        CustomSortByIcons(
          icon: Text(
            'i',
            style: ConstantText.textstyle16.copyWith(
              color: ConstantColor.kprimaryBlue,
            ),
            textAlign: TextAlign.center,
          ),
          onPressed: () {},
          backgroundColor: ConstantColor.kprimaryWhite,
        ),
        const SizedBox(width: 3),
        CustomSortByIcons(
          icon: const Icon(Icons.question_mark_outlined),
          onPressed: () {},
          backgroundColor: ConstantColor.kprimaryWhite,
        ),
        const SizedBox(width: 3),
        CustomSortByIcons(
          icon: const Icon(Icons.star_border_outlined),
          onPressed: () {},
          backgroundColor: ConstantColor.kprimaryWhite,
        ),
        const SizedBox(width: 3),
        CustomSortByIcons(
          icon: const Icon(Icons.favorite_border_outlined),
          onPressed: () {},
          backgroundColor: ConstantColor.kprimaryWhite,
        ),
      ],
    );
  }
}
