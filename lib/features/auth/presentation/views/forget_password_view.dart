import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(title: 'forget Password'),
        body: ForgetPasswordViewBody());
  }
}
