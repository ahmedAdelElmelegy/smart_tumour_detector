import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RichTextSection extends StatelessWidget {
  const RichTextSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text:  TextSpan(
          text: '  By contiuing, you agree to\n',
          style: TextStyle(
              color: const Color(0xff000000),
              fontSize: 17.sp,
              fontWeight: FontWeight.w500),
          children: <TextSpan>[
            TextSpan(
                text: 'Terms of Use ',
                style: TextStyle(
                    color:const Color(0xff2260FF),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500)),
            TextSpan(
              text: 'and',
              style:  TextStyle(
                  color: const Color(0xff000000),
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500),
            ),
            TextSpan(
                text: ' Privacy Policy',
                style: TextStyle(
                    color: const Color(0xff2260FF),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
