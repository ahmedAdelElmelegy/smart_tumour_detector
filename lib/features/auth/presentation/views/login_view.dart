import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Log In',
          style: TextStyle(
              color: const Color(0xff2260FF),
              fontSize: 25.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: const LoginViewBody(),
    );
  }
}
