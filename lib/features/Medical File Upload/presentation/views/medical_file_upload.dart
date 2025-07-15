import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/features/Medical%20File%20Upload/data/repo.dart';
import 'package:smart_tumour_detector/features/Medical%20File%20Upload/presentation/views/widgets/upload_brain_button.dart';
import 'package:smart_tumour_detector/features/Medical%20File%20Upload/presentation/views/widgets/upload_chest_button.dart';

class MedicalFileUpload extends StatefulWidget {
  const MedicalFileUpload({super.key});

  @override
  State<MedicalFileUpload> createState() => _MedicalFileUploadState();
}

class _MedicalFileUploadState extends State<MedicalFileUpload> {
  @override
  void initState() {
    ChestModel.loadAiChestModel();
    ChestModel.knowInputShape();
    ChestModel.knowOutputShape();
    BrainModel.loadAiBrainModel();
    BrainModel.knowInputShape();
    BrainModel.knowOutputShape();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColor.kprimaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            ConstantText.getTextWidget("Medical decument", FontWeight.w700, 24,
                ConstantColor.kprimaryWhite),
            SizedBox(
              width: 159,
              child: ConstantText.getTextWidget(
                  "for brain scanning",
                  FontWeight.w700,
                  24,
                  ConstantColor.kprimaryWhite,
                  TextAlign.center),
            ),
            const UploadBrainButton(text: "Upload Brain MRI"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Image.asset(
                "assets/images/image2.png",
              ),
            ),
            const SizedBox(height: 10),
            ConstantText.getTextWidget(
              "for chest scanning",
              FontWeight.w700,
              20,
              ConstantColor.kprimaryWhite,
            ),
            const UploadChestButton(text: "Upload chest X-Rays"),
            Container(
              width: 336.w,
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height > 800 ? 255.h : 200.h,
                maxHeight:
                    MediaQuery.of(context).size.height > 800 ? 255.h : 200.h,
              ),
              child: Image.asset(
                "assets/images/image1.png",
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
