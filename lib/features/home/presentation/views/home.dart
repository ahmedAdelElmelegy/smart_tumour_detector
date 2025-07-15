import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/features/home/presentation/views/widgets/app_bar_actions.dart';
import 'package:smart_tumour_detector/features/home/presentation/views/widgets/app_bar_title.dart';
import 'package:smart_tumour_detector/features/home/presentation/views/widgets/appointment_container.dart';
import 'package:smart_tumour_detector/features/home/presentation/views/widgets/doctor_card.dart';
import 'package:smart_tumour_detector/features/home/presentation/views/widgets/homepage_above_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        actions: const [AppBarActions()],
      ),
      body: Column(
        children: [
           const HomePageAboveAappointmentContainer(),
          SizedBox(height: 8.h),
          const AappointmentContainer(),
          const DoctorCard()
        ],
      ),
    );
  }
}
