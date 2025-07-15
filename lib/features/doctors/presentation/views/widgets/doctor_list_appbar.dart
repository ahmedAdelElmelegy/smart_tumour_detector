import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/NavBar/presentation/view_model/cubit/nav_cubit.dart';

class DoctorListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DoctorListAppBar({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          context.read<NavCubit>().closeExtraPage(context);
        },
      ),
      backgroundColor: ConstantColor.kprimaryWhite,
      iconTheme: IconThemeData(color: ConstantColor.kprimaryBlue),
      title: Text(
        text,
        style: ConstantText.textstyle24,
      ),
      centerTitle: true,
      actions: [
        CircleAvatar(
          backgroundColor: ConstantColor.kprimaryLightBlue,
          radius: 11,
          child: Center(
            child: IconButton(
              padding: EdgeInsets.zero,
              color: ConstantColor.kprimaryBlue,
              iconSize: 21,
              onPressed: () {},
              icon: const Icon(
                Icons.search_outlined,
              ),
            ),
          ),
        ),
        const SizedBox(width: 4.7),
        Padding(
          padding: const EdgeInsets.only(right: 38),
          child: CircleAvatar(
            backgroundColor: ConstantColor.kprimaryLightBlue,
            radius: 11.r,
            child: SvgPicture.asset(
              "assets/images/Vector2.svg",
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
