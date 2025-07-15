import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/widgets/customTextfield_bsecureText.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/title_of_fields.dart';

class ChangePasswordFields extends StatefulWidget {
  const ChangePasswordFields({
    super.key,
  });

  @override
  State<ChangePasswordFields> createState() => _ChangePasswordFieldsState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

class _ChangePasswordFieldsState extends State<ChangePasswordFields> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: const TitleOfFields(
              title: ' Password',
            ),
          ),
          CustomTextfieldWithObsecureText(
            controller: passwordController,
            onFieldSubmitted: (p0) {
              if (formKey.currentState!.validate()) {}
            },
            hint: '* * * * * * * * *',
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: const TitleOfFields(
              title: 'Confirm Password',
            ),
          ),
          CustomTextfieldWithObsecureText(
            controller: confirmPasswordController,
            onFieldSubmitted: (p0) {
              if (formKey.currentState!.validate()) {}
            },
            hint: '* * * * * * * * *',
          ),
        ],
      ),
    );
  }
}
