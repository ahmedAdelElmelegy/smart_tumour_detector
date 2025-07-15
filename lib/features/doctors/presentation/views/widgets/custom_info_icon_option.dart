import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/blue_button_insortby.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/custom_sortby_icons.dart';

class CustomInfoIconOption extends StatelessWidget {
  const CustomInfoIconOption(
      {super.key, required this.width, this.doctorModel});

  final double width;
  final DoctorModel? doctorModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlueButtonInSortBy(
          text: 'Info',
          onPressed: () {},
          style: ConstantText.textstyle15,
        ),
        SizedBox(width: width),
        CustomSortByIcons(
          icon: const Icon(Icons.calendar_month_outlined),
          onPressed: () {
            GoRouter.of(context).push(
              AppRoutes.kschudelandpatiendetails,
              extra: doctorModel,
            );
          },
          backgroundColor: ConstantColor.kprimaryWhite,
        ),
        const SizedBox(width: 3),
        CustomSortByIcons(
          icon: Text(
            'i',
            style: ConstantText.textstyle16.copyWith(
              color: ConstantColor.kprimaryBlue,
            ),
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            GoRouter.of(context)
                .push(AppRoutes.kDoctorInfo, extra: doctorModel);
          },
          backgroundColor: ConstantColor.kprimaryWhite,
        ),
        const SizedBox(width: 3),
        CustomSortByIcons(
          icon: const Icon(Icons.question_mark_outlined),
          onPressed: () {
            GoRouter.of(context).push(
              AppRoutes.kprofilepage,
              extra: doctorModel,
            );
          },
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
