// import 'package:clone_app/widgets/customTextField.dart';
// import 'package:clone_app/widgets/customTextfield_bsecureText.dart';
// import 'package:clone_app/widgets/custom_button.dart';
// import 'package:clone_app/widgets/custom_icon_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
            color: const Color(0xff2260FF),
            fontSize: 25.sp,
            fontWeight: FontWeight.bold),
      ),
      leading: Padding(
        padding: EdgeInsets.only(left: 25.w),
        child: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff2260FF),
            )),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
