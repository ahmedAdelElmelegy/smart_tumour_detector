import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/blue_button_insortby.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/custom_sortby_icons.dart';
part 'doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  DoctorsCubit() : super(DoctorsInitial());
  int selectedIndex = -1;
  SortOption selectedOption = SortOption.all;
  int selectedFavorietIndex = 0;
  DoctorsAndSevices selectedFavoretoption = DoctorsAndSevices.doctors;
  void onIconPressed(int index, SortOption option) {
    selectedIndex = index;
    selectedOption = option;

    emit(
      DoctorsSortByPageUpdate(selectedOption),
    );
  }

  Widget buildSortByIcon(
      {Text? text,
      IconData? activeIcon,
      IconData? inActiveIcon,
      required int index,
      required SortOption option}) {
    bool isSelected = selectedIndex == index;
    return CustomSortByIcons(
      onPressed: () => onIconPressed(index, option),
      icon: isSelected
          ? Icon(activeIcon, color: ConstantColor.kprimaryWhite)
          : Icon(inActiveIcon, color: ConstantColor.kprimaryBlue),
      backgroundColor: isSelected
          ? ConstantColor.kprimaryBlue
          : ConstantColor.kprimaryLightBlue,
    );
  }

  Widget buildText(int index, SortOption option) {
    bool isSelected = selectedIndex == index;
    return BlueButtonInSortBy(
      color: isSelected
          ? ConstantColor.kprimaryBlue
          : ConstantColor.kprimaryLightBlue,
      onPressed: () => onIconPressed(index, option),
      text: 'A→Z',
      style: isSelected
          ? ConstantText.textstyle12.copyWith(
              fontWeight: FontWeight.w500, color: ConstantColor.kprimaryWhite)
          : ConstantText.textstyle12.copyWith(
              fontWeight: FontWeight.w500, color: ConstantColor.kprimaryBlue),
    );
  }

  Widget buildInfoText(int index, SortOption option, BuildContext context) {
    selectedIndex == index;
    return CustomSortByIcons(
      icon: Text(
        'i',
        style: ConstantText.textstyle16.copyWith(
          color: ConstantColor.kprimaryBlue,
        ),
        textAlign: TextAlign.center,
      ),
      onPressed: () {
        GoRouter.of(context).push(AppRoutes.kDoctorInfo);
        // onIconPressed(index, option);
      },
      backgroundColor: ConstantColor.kprimaryWhite,
    );
  }

  void resetSortByOption() {
    selectedIndex = -1;

    selectedOption = SortOption.all;
    emit(DoctorsSortByPageUpdate(selectedOption));
  }

  // favoreitpage cubit
  Widget favoriteButton(String text, int index, DoctorsAndSevices option) {
    bool selected = selectedFavorietIndex == index;

    return BlueButtonInSortBy(
      onPressed: () => onFavoreitClicked(index, option),
      text: text,
      style: ConstantText.textstyle20.copyWith(
          color: selected
              ? ConstantColor.kprimaryWhite
              : ConstantColor.kprimaryBlue),
      width: 143,
      height: 41,
      raduis: 20,
      color: selected
          ? ConstantColor.kprimaryBlue
          : ConstantColor.kprimaryLightBlue,
    );
  }

  void onFavoreitClicked(int index, DoctorsAndSevices option) {
    selectedFavorietIndex = index;
    selectedFavoretoption = option;
    emit(DoctorsFavoreitPageUpdate(selectedFavoretoption));
  }

  void resetFavoriteOption() {
    selectedFavorietIndex = 0;

    selectedFavoretoption = DoctorsAndSevices.doctors;
    emit(DoctorsFavoreitPageUpdate(selectedFavoretoption));
  }
}
