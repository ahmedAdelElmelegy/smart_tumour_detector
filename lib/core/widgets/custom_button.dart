import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.width,required this.onPressed,
  });
  final String title;
  final double width;
 final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size(width, 60)),
          backgroundColor: const WidgetStatePropertyAll(Color(0xff2260FF)),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ));
  }
}
