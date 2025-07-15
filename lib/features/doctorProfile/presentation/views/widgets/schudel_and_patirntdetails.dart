import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/doctorProfile/presentation/views/widgets/avelabile_time.dart.dart';
import 'package:smart_tumour_detector/features/doctorProfile/presentation/views/widgets/doctorprofile_info_favorite.dart';
import 'package:smart_tumour_detector/features/doctorProfile/presentation/views/widgets/form_field.dart';
import 'package:smart_tumour_detector/features/doctorProfile/presentation/views/widgets/horezontial_calender.dart';
import 'package:smart_tumour_detector/features/doctorProfile/presentation/views/widgets/nameandchat_schudelpage.dart';
import 'package:smart_tumour_detector/features/doctorProfile/presentation/views/widgets/yourself_anothe.dart';

class SchudelAndPAtienDetails extends StatelessWidget {
  const SchudelAndPAtienDetails({super.key, required this.doctorModel});
  final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    PatienDetailsDoctorNameAndChat(
                      doctorModel: doctorModel,
                    ),
                    const Spacer(),
                    const DoctorProfileinfoandfavorite(),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 115.h,
                color: ConstantColor.kprimaryLightBlue,
                child: const HorizontialCalender(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 30, right: 250, bottom: 10),
                child: Text(
                  'Available Time',
                  style: ConstantText.textstyle14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ConstantColor.kprimaryBlue,
                  ),
                ),
              ),

              /////////////
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: AvaliableTimes(),
              ),
              const SizedBox(height: 10),
              Divider(
                color: ConstantColor.kprimaryBlue,
                endIndent: 30,
                indent: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Patient Details',
                  style: ConstantText.textstyle14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ConstantColor.kprimaryBlue,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: YourSelfOrAnotherPerson(),
              ),

              const Padding(
                padding: EdgeInsets.all(8.0),
                child: FormPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
