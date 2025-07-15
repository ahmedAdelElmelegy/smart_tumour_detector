import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/reset_password_view_body.dart.dart';


class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(title: 'Forget Password'),
        body: ResetPasswordViewBody());
  }
}
