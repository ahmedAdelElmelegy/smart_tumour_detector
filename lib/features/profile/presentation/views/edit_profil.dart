import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/widgets/customTextField.dart';
import 'package:smart_tumour_detector/core/widgets/customTextfield_bsecureText.dart';
import 'package:smart_tumour_detector/features/auth/data/models/form_validators_class.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:smart_tumour_detector/features/auth/presentation/widgets/title_of_fields.dart';
import 'package:smart_tumour_detector/features/profile/presentation/widgets/edit_profile_action.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Profile'),
      body: EditProfileViewBody(),
    );
  }
}

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => EditProfileViewBodyState();
}

class EditProfileViewBodyState extends State<EditProfileViewBody> {
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
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(clipBehavior: Clip.none, children: [
                  const CircleAvatar(
                    backgroundImage:
                         AssetImage('assets/images/Maskgroup.png'),
                    radius: 50,
                  ),
                  Positioned(
                    top: 65,
                    left: 65,
                    child: IconButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Color(0xff2260FF)),
                            shape: WidgetStatePropertyAll(CircleBorder())),
                        onPressed: () {},
                        icon:const Icon(
                          size: 20,
                          Icons.edit_outlined,
                          color: Colors.white,
                        )),
                  )
                ]),
              ),
              SizedBox(
                height: 20.h,
              ),
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
              SizedBox(
                height: 20.h,
              ),
              EditProfileAction(
                formKey: formKey,
                emailController: emailController,
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                userNameController: userNameController,
                passwordController: passwordController,
                mobileController: mobileController,
                dateController: dateController,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

