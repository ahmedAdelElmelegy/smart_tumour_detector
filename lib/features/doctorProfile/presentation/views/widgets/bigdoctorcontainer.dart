import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/core/widgets/custom_doctor_name_container.dart';
import 'package:smart_tumour_detector/features/doctorProfile/presentation/views/widgets/big_favoriteand_info.dart';
import 'package:smart_tumour_detector/features/home/presentation/views/widgets/star_and_comment.dart';

class BigDoctorContainercontent extends StatelessWidget {
  const BigDoctorContainercontent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      width: 310.w,
      height: 110.h,
      decoration: BoxDecoration(
          color: ConstantColor.kprimaryLightBlue,
          borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(
              'assets/images/Maskgroup1.png',
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomDoctorNameContainer(
                  width: 220.w,
                  height: 50.h,
                  text: Text(
                    textAlign: TextAlign.center,
                    'Dr. Olivia Turner, M.D.',
                    style: ConstantText.textstyle14.copyWith(
                      color: ConstantColor.kprimaryBlue,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const StarAndComment(),
                  SizedBox(width: 75.w),
                  const BigFavoreiteAndInfo()
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}




