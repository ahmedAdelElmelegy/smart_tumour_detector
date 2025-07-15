import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/doctorinfo_experencecontainer_shape.dart';

class DcoctorInfoExperenceContainer extends StatelessWidget {
  const DcoctorInfoExperenceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 18),
        child: DoctorInfoExperienceContainerShape(
          height: 35,
          width: 118,
          widget: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/images/experencemark.svg",
                  height: 23,
                  width: 23,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "15 years\n",
                        style: ConstantText.textstyle12.copyWith(
                          fontWeight: FontWeight.w400,
                          color: ConstantColor.kprimaryWhite,
                        ),
                      ),
                      TextSpan(
                        text: " experience",
                        style: ConstantText.textstyle12.copyWith(
                          color: ConstantColor.kprimaryWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(height: 6),
      DoctorInfoExperienceContainerShape(
        width: 130,
        height: 130,
        widget: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: SingleChildScrollView(
                child: RichText(
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.fade,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Focus:",
                        style: ConstantText.textstyle12.copyWith(
                          fontWeight: FontWeight.w600,
                          color: ConstantColor.kprimaryWhite,
                        ),
                      ),
                      TextSpan(
                        text:
                            " The impact of hormonal imbalances on skin conditions, specializing in acne, hirsutism, and other skin disorders.",
                        style: ConstantText.textstyle12.copyWith(
                          color: ConstantColor.kprimaryWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
