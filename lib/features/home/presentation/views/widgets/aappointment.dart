import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class Aappointment extends StatelessWidget {
  const Aappointment({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Screen height: ${MediaQuery.of(context).size.height}");
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(right: 10.w, left: 20.w),
          width: 299.w,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height > 800 ? 130.h : 90.h,
            maxHeight: MediaQuery.of(context).size.height > 800 ? 130.h : 90.h,
          ),
          decoration: BoxDecoration(
              color: ConstantColor.kprimaryWhite,
              borderRadius: BorderRadius.circular(20.r)),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              ConstantText.getTextWidget(
                "${DateFormat('d').format(DateTime.now())} ${DateFormat('EEEE').format(DateTime.now())} - Today",
                FontWeight.w400,
                14,
                ConstantColor.kprimaryBlue,
              ),
              Row(children: [
                Expanded(
                    child: Column(
                  children: [
                    ConstantText.getTextWidget(
                      '9AM',
                      FontWeight.w300,
                      12,
                      ConstantColor.kprimaryBlue,
                    ),
                    const SizedBox(height: 5),
                    ConstantText.getTextWidget(
                      '10AM',
                      FontWeight.w300,
                      12,
                      ConstantColor.kprimaryBlue,
                    ),
                    const SizedBox(height: 5),
                    ConstantText.getTextWidget(
                      '11AM',
                      FontWeight.w300,
                      12,
                      ConstantColor.kprimaryBlue,
                    ),
                    const SizedBox(height: 5),
                    ConstantText.getTextWidget(
                      '12AM',
                      FontWeight.w300,
                      12,
                      ConstantColor.kprimaryBlue,
                    ),
                  ],
                )),
                const SizedBox(width: 2),
                Expanded(
                    flex: 8,
                    child: Column(
                      children: [
                        DottedLine(
                          dashColor: ConstantColor.kprimaryBlue,
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              width: 203.w,
                              height: 51.h,
                              decoration: BoxDecoration(
                                  color: ConstantColor.kprimaryLightBlue,
                                  borderRadius: BorderRadius.circular(13.r)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: ConstantText.getTextWidget(
                                        "Dr. Olivia Turner, M.D.",
                                        FontWeight.w500,
                                        14,
                                        ConstantColor.kprimaryBlue),
                                  ),
                                  CircleAvatar(
                                    radius: 6.r,
                                    backgroundColor:
                                        ConstantColor.kprimaryWhite,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.check,
                                        size: 12,
                                      ),
                                      color: ConstantColor.kprimaryBlue,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 6.r,
                                    backgroundColor:
                                        ConstantColor.kprimaryWhite,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.close,
                                        size: 12,
                                      ),
                                      color: ConstantColor.kprimaryBlue,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        const SizedBox(height: 8),
                        DottedLine(
                          dashColor: ConstantColor.kprimaryBlue,
                        ),
                      ],
                    ))
              ]),
              const SizedBox(height: 10)
            ]),
          ),
        ),
      ],
    );
  }
}
