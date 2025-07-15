import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';
import 'package:smart_tumour_detector/core/widgets/customTextField.dart';
import 'package:smart_tumour_detector/core/widgets/customTextfield_bsecureText.dart';
import 'package:smart_tumour_detector/features/auth/data/models/form_validators_class.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/login_action_section.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/title_of_fields.dart';

class SignInInputsSection extends StatefulWidget {
  const SignInInputsSection({super.key});

  @override
  State<SignInInputsSection> createState() => _SignInInputsSectionState();
}

class _SignInInputsSectionState extends State<SignInInputsSection> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: TextStyle(
                color: const Color(0xff2260FF),
                fontSize: 25.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),
          const Text(
            'to smart tumour detector',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: const TitleOfFields(
              title: 'email',
            ),
          ),
          Customtextfield(
            controller: emailController,
            validator:(value) => FormValidators.validateEmail(value),
            hint: 'd0JtC@example.com' ,
            keyboardType: TextInputType.text,
            onFieldSubmitted: (p0) {
              if (key.currentState!.validate()) {}
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: TitleOfFields(
              title: 'Password',
            ),
          ),
          CustomTextfieldWithObsecureText(
            controller: passwordController,
            onFieldSubmitted: (p0) {
              if (key.currentState!.validate()) {}
            },
            hint: '* * * * * * * * *',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.kForgetPassword);
                },
                child: Text(
                  'forget password',
                  style: TextStyle(
                      color: const Color(0xff2260FF),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          LoginActionSection(
            emailController: emailController,
            passwordController: passwordController,
            formKey: key,
          )
        ],
      ),
    );
  }
}
