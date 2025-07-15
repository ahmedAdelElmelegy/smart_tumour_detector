import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/Lab%20Result/presentation/views/widgets/lab_result_container.dart';

class ParentLabResultContainer extends StatelessWidget {
  const ParentLabResultContainer({super.key, required this.result});
final String result;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600.h,
        width: 358.w,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 239, 247, 244),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(52.r),
              topRight: Radius.circular(52.r),
              bottomLeft: Radius.circular(38.r),
              bottomRight: Radius.circular(38.r),
            )),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                "Finished",
                style: ConstantText.textstyle22,
              ),
            ),
             LabresultContainer(result:result ,)
          ],
        ));
  }
}

