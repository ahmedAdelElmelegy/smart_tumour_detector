import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/features/NavBar/presentation/view_model/cubit/nav_cubit.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/doctors_view.dart';
import 'package:smart_tumour_detector/features/home/presentation/views/widgets/textfield.dart';

class HomePageAboveAappointmentContainer extends StatelessWidget {
  const HomePageAboveAappointmentContainer({
    super.key,
    this.doctorModel,
  });
  final DoctorModel? doctorModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, top: 20.h),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.9.h),
            child: GestureDetector(
              onTap: () {
                context.read<NavCubit>().openExtraPage(DoctorList(
                      doctorModel: doctorModel,
                    ));
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/Vector.svg",
                  ),
                  ConstantText.getTextWidget("Doctors", FontWeight.w300, 12,
                      ConstantColor.kprimaryBlue),
                ],
              ),
            ),
          ),
          SizedBox(width: 15.w),
          Column(
            children: [
              InkWell(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRoutes.kFavorite,
                    extra: true,
                  );
                },
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: ConstantColor.kprimaryBlue,
                ),
              ),
              ConstantText.getTextWidget(
                  "Favorite", FontWeight.w300, 12, ConstantColor.kprimaryBlue),
            ],
          ),
          SizedBox(width: 15.w),
          Container(
            alignment: Alignment.center,
            width: 190.w,
            height: 33.h,
            decoration: BoxDecoration(
                color: ConstantColor.kprimaryLightBlue,
                borderRadius: BorderRadius.circular(23.r)),
            child: CustomTextForm(
              pre: Padding(
                padding: EdgeInsets.only(top: 2.h, bottom: 2.h, left: 0.w),
                child: SvgPicture.asset(
                  "assets/images/Group108.svg",
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              suff: Icon(
                Icons.search_outlined,
                color: ConstantColor.kprimaryBlue,
              ),
              label: "",
              scure: false,
              colors: ConstantColor.kprimaryLightBlue,
            ),
          )
        ],
      ),
    );
  }
}
