import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/doctorProfile/presentation/views/widgets/bigdoctorcontainer.dart';
import 'package:smart_tumour_detector/features/doctorProfile/presentation/views/widgets/booking_summary_details.dart';

class Yourappointmentdetails extends StatelessWidget {
  const Yourappointmentdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your appointment',
          style: ConstantText.textstyle24,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: ConstantColor.kprimaryBlue,
          ),
        ),
      ),
      body: const Column(
        children: [
          BigDoctorContainercontent(),
          BookingSummarySection(),
        ],
      ),
    );
  }
}


