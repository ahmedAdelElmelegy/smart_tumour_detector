import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';
import 'package:smart_tumour_detector/features/Medical%20File%20Upload/data/repo.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class UploadChestButton extends StatefulWidget {
  const UploadChestButton({super.key, required this.text});
  final String text;

  @override
  State<UploadChestButton> createState() => _UploadChestButtonState();
}

class _UploadChestButtonState extends State<UploadChestButton> {
  XFile? _pickedIMage;
  Future<void> pickGalleryImage() async {
    final imagePicker = ImagePicker();

    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedIMage = XFile(pickedFile.path);
      });
      final imageBytes = await _pickedIMage!.readAsBytes();
      final input = ChestModel.imageToByteListFloat32(imageBytes, 224, 224, 3);

      // apply model on input
      var output = List.filled(2, 0.0).reshape([1, 2]);
      ChestModel.interpreter.allocateTensors();
      ChestModel.interpreter.run(input.reshape([1, 224, 224, 3]), output);
      if (mounted) {
        if (output[0][0] > output[0][1]) {
          log("NORMAL");
          GoRouter.of(context).push(AppRoutes.kLabResult, extra: "NORMAL");
        } else if (output[0][0] < output[0][1]) {
          log("PNEUMONIA");
          GoRouter.of(context).push(AppRoutes.kLabResult, extra: "PNEUMONIA");
        } else {
          log("⚠️ Cannot determine result (equal probability)");
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
      final input = ChestModel.imageToByteListFloat32(imageBytes, 224, 224, 3);
      // apply input to model
      var output = List.filled(2, 0.0).reshape([1, 2]);
      ChestModel.interpreter.allocateTensors();
      ChestModel.interpreter.run(input.reshape([1, 224, 224, 3]), output);
      if (mounted) {
        if (output[0][0] > output[0][1]) {
          log("NORMAL");
          GoRouter.of(context).push(AppRoutes.kLabResult, extra: "NORMAL");
        } else if (output[0][0] < output[0][1]) {
          log("PNEUMONIA");
          GoRouter.of(context).push(AppRoutes.kLabResult, extra: "PNEUMONIA");
        } else {
          log("⚠️ Cannot determine result (equal probability)");
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
