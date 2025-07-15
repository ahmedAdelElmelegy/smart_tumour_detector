import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/doctorinfo_avelapletime.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/doctorinfo_experence_container.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/doctorinfo_namejop.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/schedueland_four_details_icon.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key, this.doctorModel});
  final DoctorModel? doctorModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DoctorInfo',
          style: ConstantText.textstyle24,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: ConstantColor.kprimaryBlue,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              width: 315.w,
              height: 330.h,
              decoration: BoxDecoration(
                color: ConstantColor.kprimaryLightBlue,
                borderRadius: BorderRadius.circular(17.r),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          onBackgroundImageError: (exception, stackTrace) {
                            Image.asset('assets/images/Maskgroup1.png');
                          },
                          radius: 70,
                          backgroundImage: MemoryImage(
                              base64Decode(doctorModel?.profilePicture ?? '')),
                        ),
                        const Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: DcoctorInfoExperenceContainer(),
                        )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    DoctorInfoNameAndJop(
                      doctorModel: doctorModel,
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: DoctorInfoAvelapileTime(),
                    ),
                    const SizedBox(height: 25),
                    const Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: ScheduelandFourDetailsIcon(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35),
            Text(
              "Profile",
              style: ConstantText.textstyle14.copyWith(
                fontWeight: FontWeight.w500,
                color: ConstantColor.kprimaryBlue,
              ),
            ),
            const SizedBox(height: 80),
            Text(
              "Career path",
              style: ConstantText.textstyle14.copyWith(
                fontWeight: FontWeight.w500,
                color: ConstantColor.kprimaryBlue,
              ),
            ),
            const SizedBox(height: 80),
            Text(
              "Highlights",
              style: ConstantText.textstyle14.copyWith(
                fontWeight: FontWeight.w500,
                color: ConstantColor.kprimaryBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
