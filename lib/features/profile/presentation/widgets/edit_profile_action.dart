import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/widgets/custom_button.dart';
import 'package:smart_tumour_detector/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:smart_tumour_detector/features/auth/presentation/view_model/auth_cubit/auth_state.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/show_succesful_dialog.dart';

class EditProfileAction extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final TextEditingController mobileController;
  final TextEditingController dateController;

  const EditProfileAction({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.firstNameController,
    required this.passwordController,
    required this.mobileController,
    required this.dateController,
    required this.lastNameController,
    required this.userNameController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 16),
                  Text('Registering...'),
                ],
              ),
              duration: Duration(seconds: 2),
            ),
          );
        } else if (state is RegisterSuccess) {
          Future.microtask(() {
            showSuccesfulRegDialog(context);
          });
        } else if (state is RegisterFailure) {
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
                    context.read<AuthCubit>().register(
                      data: {
                        'email': emailController.text.trim(),
                        'firstName': firstNameController.text.trim(),
                        'lastName': lastNameController.text.trim(),
                        'mobilePhone': mobileController.text.trim(),
                        'password': passwordController.text.trim(),
                        'userName': userNameController.text.trim(),
                      },
                    );
                  }
                },
                title: ' Update Profile',
                width: 250.w,
              )
            ],
          ),
        );
      },
    );
  }
}
