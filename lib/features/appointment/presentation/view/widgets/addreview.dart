import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view/widgets/cancel_appointment_enter_reason.dart';

class Addreview extends StatelessWidget {
  const Addreview({super.key, required this.doctorModel});
  final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: ConstantColor.kprimaryBlue,
            )),
        centerTitle: true,
        title: Text(
          "Review",
          style: ConstantText.textstyle24,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: MemoryImage(
                base64Decode(
                  doctorModel.profilePicture,
                ),
              ),
            ),
            Text(
              "Dr. ${doctorModel.firstName} ${doctorModel.lastName}",
              style: ConstantText.textstyle24.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: ConstantColor.kprimaryLightBlue,
                  radius: 11.r,
                  child: Icon(
                    Icons.favorite,
                    color: ConstantColor.kprimaryBlue,
                    size: 16,
                  ),
                ),
                SizedBox(width: 4.w),
                Container(
                  alignment: Alignment.center,
                  width: 123.w,
                  height: 23.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23.r),
                    color: ConstantColor.kprimaryLightBlue,
                  ),
                  child: SimpleStarRating(
                    nonFilledIcon: Icon(
                      Icons.star_border_outlined,
                      color: ConstantColor.kprimaryBlue,
                      size: 20,
                    ),
                    filledIcon: Icon(
                      Icons.star,
                      color: ConstantColor.kprimaryBlue,
                      size: 20,
                    ),
                    isReadOnly: false,
                    allowHalfRating: true,
                    starCount: 5,
                    rating: 0,
                    onRated: (rate) {},
                    spacing: 6,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: AppointmentEnterReason(
                  reasonController: controller,
                  hintText: "enter your comment here..."),
            ),
            Container(
              alignment: Alignment.center,
              width: 256.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: ConstantColor.kprimaryBlue,
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Review Added'),
                    ),
                  );
                },
                child: Text(
                  "Add Review",
                  style: ConstantText.textstyle20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
