import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/doctor_info_schudele.dart';

class Schedule extends StatelessWidget {
  const Schedule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: ConstantColor.kprimaryBlue,
            ),
          ),
          const DoctorInfoScheduel(),
        ],
      ),
    );
  }
}
