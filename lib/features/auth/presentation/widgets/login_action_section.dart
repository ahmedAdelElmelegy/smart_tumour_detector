import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';
import 'package:smart_tumour_detector/core/widgets/custom_button.dart';
import 'package:smart_tumour_detector/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:smart_tumour_detector/features/auth/presentation/view_model/auth_cubit/auth_state.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/dont_have_account_row.dart';

class LoginActionSection extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const LoginActionSection({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 16),
                  Text('Logging in...'),
                ],
              ),
              duration: Duration(seconds: 2),
            ),
          );
        } else if (state is LoginSuccess) {
          GoRouter.of(context).go(AppRoutes.kNavbar);
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthCubit>().login(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                  }
                },
                title: 'Log In',
                width: 250.w,
              ),
              SizedBox(height: 10.h),
              const DontHaveAccountRow(),
            ],
          ),
        );
      },
    );
  }
}
