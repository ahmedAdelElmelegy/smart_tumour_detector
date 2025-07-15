import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/view_model/doctors_cubit/doctors_cubit.dart';

class FavorietOption extends StatelessWidget {
  const FavorietOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 35, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              context
                  .read<DoctorsCubit>()
                  .favoriteButton("Doctors", 0, DoctorsAndSevices.doctors),
              context
                  .read<DoctorsCubit>()
                  .favoriteButton("Services", 1, DoctorsAndSevices.services),
            ],
          ),
        );
      },
    );
  }
}
