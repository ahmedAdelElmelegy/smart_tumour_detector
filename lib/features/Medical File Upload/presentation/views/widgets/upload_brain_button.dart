import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';
import 'package:smart_tumour_detector/features/Medical%20File%20Upload/data/repo.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class UploadBrainButton extends StatefulWidget {
  const UploadBrainButton({super.key, required this.text});
  final String text;

  @override
  State<UploadBrainButton> createState() => _UploadBrainButtonState();
}

class _UploadBrainButtonState extends State<UploadBrainButton> {
  XFile? _pickedIMage;
  Future<void> pickGalleryImage() async {
    final imagePicker = ImagePicker();

    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedIMage = XFile(pickedFile.path);
      });
      final imageBytes = await _pickedIMage!.readAsBytes();
      final input = BrainModel.imageToByteListFloat32(imageBytes, 150, 150, 3);

      // apply model on input
      var output = List.filled(4, 0.0).reshape([1, 4]);
      BrainModel.interpreter.allocateTensors();
      BrainModel.interpreter.run(input.reshape([1, 150, 150, 3]), output);
      if (mounted) {
        if (output[0][0] > output[0][1] &&
            output[0][0] > output[0][2] &&
            output[0][0] > output[0][3]) {
          log("glioma_tumor");
          GoRouter.of(context)
              .push(AppRoutes.kLabResult, extra: "glioma_tumor");
        } else if (output[0][1] > output[0][0] &&
            output[0][1] > output[0][2] &&
            output[0][1] > output[0][3]) {
          log("no_tumor");
          GoRouter.of(context).push(AppRoutes.kLabResult, extra: "no_tumor");
        } else if (output[0][2] > output[0][1] &&
            output[0][2] > output[0][0] &&
            output[0][2] > output[0][3]) {
          log("meningioma_tumor");
          GoRouter.of(context)
              .push(AppRoutes.kLabResult, extra: "meningioma_tumor");
        } else if (output[0][3] > output[0][1] &&
            output[0][3] > output[0][0] &&
            output[0][3] > output[0][2]) {
          log("pituitary_tumor");
          GoRouter.of(context)
              .push(AppRoutes.kLabResult, extra: "pituitary_tumor");
        } else {
          log("⚠️ Cannot determine ");
          GoRouter.of(context).push(AppRoutes.kLabResult, extra: "unkown");
        }
      }

      log("✅ Prediction result: $output");
    } else {
      return;
    }
  }

  Future<void> pickeCameraImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? camera = await picker.pickImage(source: ImageSource.camera);
    if (camera != null) {
      setState(() {
        _pickedIMage = XFile(camera.path);
      });

      final imageBytes = await _pickedIMage!.readAsBytes();
      final input = BrainModel.imageToByteListFloat32(imageBytes, 150, 150, 3);
      // apply input to model
      var output = List.filled(4, 0.0).reshape([1, 4]);
      BrainModel.interpreter.allocateTensors();
      BrainModel.interpreter.run(input.reshape([1, 150, 150, 3]), output);
      if (mounted) {
        if (output[0][0] > output[0][1] &&
            output[0][0] > output[0][2] &&
            output[0][0] > output[0][3]) {
          log("glioma_tumor");
          GoRouter.of(context)
              .push(AppRoutes.kLabResult, extra: "glioma_tumor");
        } else if (output[0][1] > output[0][0] &&
            output[0][1] > output[0][2] &&
            output[0][1] > output[0][3]) {
          log("no_tumor");
          GoRouter.of(context).push(AppRoutes.kLabResult, extra: "no_tumor");
        } else if (output[0][2] > output[0][1] &&
            output[0][2] > output[0][0] &&
            output[0][2] > output[0][3]) {
          log("meningioma_tumor");
          GoRouter.of(context)
              .push(AppRoutes.kLabResult, extra: "meningioma_tumor");
        } else if (output[0][3] > output[0][1] &&
            output[0][3] > output[0][0] &&
            output[0][3] > output[0][2]) {
          log("pituitary_tumor");
          GoRouter.of(context)
              .push(AppRoutes.kLabResult, extra: "pituitary_tumor");
        } else {
          log("⚠️ Cannot determine ");
          GoRouter.of(context).push(AppRoutes.kLabResult, extra: "unkown");
        }
      }
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          pickGalleryImage();
                        },
                        child: const Text('From Gallery'),
                      ),
                      TextButton(
                        onPressed: () {
                          pickeCameraImage();
                        },
                        child: const Text('From Camera'),
                      ),
                    ],
                  ),
                ));
      },
      child: ConstantText.getTextWidget(
        widget.text,
        FontWeight.w700,
        20,
        ConstantColor.kprimaryUploadButton,
      ),
    );
  }
}
