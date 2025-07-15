import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleOfFields extends StatelessWidget {
  const TitleOfFields({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: const Color(0xff000000),
          fontSize: 20.sp,
          fontWeight: FontWeight.bold),
    );
  }
}
