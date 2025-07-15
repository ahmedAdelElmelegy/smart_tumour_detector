import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'New Account'),
      body: SignUpViewBody(),
    );
  }
}
