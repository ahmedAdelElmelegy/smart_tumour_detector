import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/widgets/customTextField.dart';
import 'package:smart_tumour_detector/core/widgets/custom_button.dart';
import 'package:smart_tumour_detector/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:smart_tumour_detector/features/auth/presentation/view_model/auth_cubit/auth_state.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _SetPasswordViewBodyState();
}

late TextEditingController emailController;
GlobalKey<FormState> key = GlobalKey<FormState>();

class _SetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ForgotPasswordLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else {
            Navigator.of(context, rootNavigator: true).pop();

            if (state is ForgotPasswordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is ForgotPasswordFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.only(
              left: 25.w,
              right: 25.w,
              top: 70.h,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/reset_image.png',
                    height: 300.h,
                    width: 300.w,
                  ),
                  Customtextfield(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    hint: 'john@gmail.com',
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        context
                            .read<AuthCubit>()
                            .forgetPassword(emailController.text.trim());
                      }
                    },
                    title: 'Send Reset Link',
                    width: 322.w,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
