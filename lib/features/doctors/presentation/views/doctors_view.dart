import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/doctor_list_view_body.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({
    super.key,
    this.doctorModel,
  });
  final DoctorModel? doctorModel;
  @override
  Widget build(BuildContext context) {
    return DoctorListViewBody(
      doctorModel: doctorModel,
    );
  }
}
