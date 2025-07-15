import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/NavBar/presentation/view_model/cubit/nav_cubit.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, NavState>(builder: (context, state) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 18.w, horizontal: 24),
        padding: EdgeInsets.symmetric(vertical: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: ConstantColor.kprimaryBlue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            selectWidget(0,
                onTap: () => context.read<NavCubit>().selectPage(0),
                icon: Icons.home_outlined),
            selectWidget(1,
                onTap: () => context.read<NavCubit>().selectPage(1),
                icon: Icons.person_outline_outlined),
            selectWidget(2,
                onTap: () => context.read<NavCubit>().selectPage(2),
                icon: Icons.calendar_month_outlined),
          ],
        ),
      );
    });
  }

  Widget selectWidget(int index,
      {required void Function() onTap, required IconData icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 24.sp,
        color: index == context.read<NavCubit>().initialPage
            ? ConstantColor.kprimaryBlack
            : ConstantColor.kprimaryWhite,
      ),
    );
  }
}
