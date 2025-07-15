import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/view_model/doctors_cubit/doctors_cubit.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/doctor_list_appbar.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/favorite.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/rating.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/sortby_options.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/sortby_page_doctorcontainer.dart';

class DoctorListViewBody extends StatelessWidget {
  const DoctorListViewBody({super.key, this.doctorModel});
  final DoctorModel? doctorModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsState>(
      builder: (context, state) {
        final cubit = context.read<DoctorsCubit>();
        final (appBar, content) =
            diffrentCases(cubit.selectedOption, doctorModel);

        return Scaffold(
          appBar: appBar,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SortbyOptions(),
                Expanded(child: content),
              ],
            ),
          ),
        );
      },
    );
  }

  (DoctorListAppBar, Widget) diffrentCases(
      selectedOption, DoctorModel? doctorModel) {
    switch (selectedOption) {
      case SortOption.rating:
        return (
          const DoctorListAppBar(text: "Rating"),
          const Rating(),
        );

      case SortOption.favorite:
        return (
          const DoctorListAppBar(text: "Favorite"),
          const Favorite(showAppBar: false,),
        );

      // case SortOption.doctorInfo:
      //   return (
      //     const DoctorListAppBar(text: "Doctor Info"),
      //      DoctorInfo(doctorModel: doctorModel),
      //   );

      default:
        return (
          const DoctorListAppBar(text: "Doctors"),
          const SortByPageDoctorContainer(),
        );
    }
  }
}
