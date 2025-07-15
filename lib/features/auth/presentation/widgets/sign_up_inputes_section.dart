import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/widgets/customTextField.dart';
import 'package:smart_tumour_detector/core/widgets/customTextfield_bsecureText.dart';
import 'package:smart_tumour_detector/features/auth/data/models/form_validators_class.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/rich_text_section.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/sign_up_action.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/title_of_fields.dart';

class SignUpInputesSection extends StatefulWidget {
  const SignUpInputesSection({super.key});

  @override
  State<SignUpInputesSection> createState() => _SignUpInputesSectionState();
}

class _SignUpInputesSectionState extends State<SignUpInputesSection> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final TextEditingController emailController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController userNameController;
  late final TextEditingController mobileController;
  late final TextEditingController dateController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    userNameController = TextEditingController();
    mobileController = TextEditingController();
    dateController = TextEditingController();
    passwordController = TextEditingController();
  }

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
              title: 'First Name',
            ),
          ),
          Customtextfield(
            controller: firstNameController,
            keyboardType: TextInputType.name,
            onFieldSubmitted: (p0) {
              if (formKey.currentState!.validate()) {}
            },
            validator: (value) => FormValidators.validatefirstName(value),
            hint: '',
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: const TitleOfFields(
              title: 'last Name',
            ),
          ),
          Customtextfield(
            controller: lastNameController,
            keyboardType: TextInputType.name,
            onFieldSubmitted: (p0) {
              if (formKey.currentState!.validate()) {}
            },
            validator: (value) => FormValidators.validatelastName(value),
            hint: '',
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: const TitleOfFields(
              title: 'User Name',
            ),
          ),
          Customtextfield(
            controller: userNameController,
            keyboardType: TextInputType.name,
            onFieldSubmitted: (p0) {
              if (formKey.currentState!.validate()) {}
            },
            validator: (value) => FormValidators.validateUserName(value),
            hint: '',
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: const TitleOfFields(
              title: 'Password',
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
              title: 'Email',
            ),
          ),
          Customtextfield(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted: (p0) {
              if (formKey.currentState!.validate()) {}
            },
            validator: (value) => FormValidators.validateEmail(value),
            hint: 'example@example.com',
          ),
          SizedBox(
            height: 20.sp,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: const TitleOfFields(
              title: 'Mobile Number',
            ),
          ),
          Customtextfield(
            controller: mobileController,
            keyboardType: TextInputType.phone,
            onFieldSubmitted: (p0) {
              if (formKey.currentState!.validate()) {}
            },
            validator: (value) => FormValidators.validateMobile(value),
            hint: '',
          ),
          SizedBox(
            height: 20.h,
          ),
          const RichTextSection(),
          SizedBox(
            height: 20.h,
          ),
          SignUpAction(
            formKey: formKey,
            emailController: emailController,
            firstNameController: firstNameController,
            lastNameController: lastNameController,
            userNameController: userNameController,
            passwordController: passwordController,
            mobileController: mobileController,
            dateController: dateController,
          ),
        ],
      ),
    );
  }
}
