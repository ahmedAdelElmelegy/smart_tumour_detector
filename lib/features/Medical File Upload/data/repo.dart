import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:developer';

class ChestModel {
  static late Interpreter interpreter;
  static Future<void> loadAiChestModel() async {
    interpreter =
        await Interpreter.fromAsset('assets/ai_model/cnn_chest_model.tflite');
    log("loadAiChestModel:${interpreter.toString()}");
  }

  static knowInputShape() async {
    var chestinputShape = interpreter.getInputTensor(0).shape;
    var chestInputType = interpreter.getInputTensor(0).type;
    log('chestinputShape:${chestinputShape.toString()}');
    log('chestInputType:${chestInputType.toString()}');
  }

  static knowOutputShape() async {
    var chestoutputShape = interpreter.getOutputTensor(0).shape;
    var chestoutputType = interpreter.getOutputTensor(0).type;
    log('chestoutputShape:${chestoutputShape.toString()}');
    log('chestoutputType:${chestoutputType.toString()}');
  }

  static List imageToByteListFloat32(
      Uint8List imageByte, int height, int weidth, int channel) {
    final image = img.decodeImage(imageByte);
    final resizeImage = img.copyResize(image!, width: weidth, height: height);
    var convertBytes = Float32List(1 * height * weidth * 3);
    var bufferIndex = 0;
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < weidth; x++) {
        final pixel = resizeImage.getPixel(x, y);
        convertBytes[bufferIndex++] = pixel.r.toDouble() / 255;
        convertBytes[bufferIndex++] = pixel.g.toDouble() / 255;
        convertBytes[bufferIndex++] = pixel.b.toDouble() / 255;
      }
    }
    return convertBytes;
  }
}

/// Brain MOdel
class BrainModel {
  static late Interpreter interpreter;
  static Future<void> loadAiBrainModel() async {
    interpreter =
        await Interpreter.fromAsset('assets/ai_model/cnn_brain_model.tflite');
    log("loadAiBrainModel:${interpreter.toString()}");
  }

  static knowInputShape() async {
    var braininputShape = interpreter.getInputTensor(0).shape;
    var brainInputType = interpreter.getInputTensor(0).type;
    log('braininputShape:${braininputShape.toString()}');
    log('brainInputType:${brainInputType.toString()}');
  }

  static knowOutputShape() async {
    var brainoutputShape = interpreter.getOutputTensor(0).shape;
    var brainoutputType = interpreter.getOutputTensor(0).type;
    log('brainoutputShape:${brainoutputShape.toString()}');
    log('brainoutputType:${brainoutputType.toString()}');
  }

  static List imageToByteListFloat32(
      Uint8List imageByte, int height, int weidth, int channels) {
    final image = img.decodeImage(imageByte);

    final resizeImage = img.copyResize(image!, width: weidth, height: height);
    var convertBytes = Float32List(1 * height * weidth * 3);
    var bufferIndex = 0;
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < weidth; x++) {
        final pixel = resizeImage.getPixel(x, y);
        convertBytes[bufferIndex++] = pixel.r.toDouble() / 255;
        convertBytes[bufferIndex++] = pixel.g.toDouble() / 255;
        convertBytes[bufferIndex++] = pixel.b.toDouble() / 255;
      }
    }
    return convertBytes;
  }
}
