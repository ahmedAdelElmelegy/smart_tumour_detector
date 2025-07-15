import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/view_model/doctors_cubit/doctors_cubit.dart';

class SortbyOptions extends StatelessWidget {
  const SortbyOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DoctorsCubit>();
    return BlocBuilder<DoctorsCubit, DoctorsState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 21.h, bottom: 13.h),
          child: Row(
            children: [
              Text("Sort by", style: ConstantText.textstyle12),
              const SizedBox(width: 1),
              cubit.buildText(-1, SortOption.all),
              const SizedBox(width: 3),
              cubit.buildSortByIcon(
                activeIcon: Icons.star,
                inActiveIcon: Icons.star_border_outlined,
                index: 0,
                option: SortOption.rating,
              ),
              const SizedBox(width: 3),
              cubit.buildSortByIcon(
                activeIcon: Icons.favorite,
                inActiveIcon: Icons.favorite_border_outlined,
                index: 1,
                option: SortOption.favorite,
              ),
              const SizedBox(width: 3),
              
            ],
          ),
        );
      },
    );
  }
}
