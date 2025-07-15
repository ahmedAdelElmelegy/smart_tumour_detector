import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

Widget buildCategoryTile(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 23.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(21.r),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 10),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 5),
        trailing: CircleAvatar(
          backgroundColor: ConstantColor.kprimaryWhite,
          child: Icon(
            Icons.keyboard_arrow_down,
            color: ConstantColor.kprimaryBlue,
            size: 35,
          ),
        ),
        title: Row(
          children: [
            Icon(
              Icons.favorite,
              color: ConstantColor.kprimaryWhite,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                title,
                style: ConstantText.textstyle15.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ConstantColor.kprimaryWhite,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
        backgroundColor: ConstantColor.kprimaryLightBlue,
        collapsedBackgroundColor: ConstantColor.kprimaryBlue,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(21.r)),
        children: [
          Column(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: ConstantColor.kprimaryWhite,
                  borderRadius: BorderRadius.circular(21.r),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Details about $title ",
                  style: ConstantText.textstyle16.copyWith(
                    color: ConstantColor.kprimaryBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: ConstantColor.kprimaryWhite,
                  borderRadius: BorderRadius.circular(21.r),
                ),
              ),
              _buildLookingDoctorsButton()
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildLookingDoctorsButton() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      color: ConstantColor.kprimaryLightBlue,
      borderRadius: BorderRadius.circular(21),
    ),
    child: Text(
      "Looking Doctors",
      style: ConstantText.textstyle20.copyWith(
        color: ConstantColor.kprimaryBlue,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}