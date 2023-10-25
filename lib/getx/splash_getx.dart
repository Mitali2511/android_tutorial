import 'dart:async';
import 'package:get/get.dart';

class SplashGetController extends GetxController {
  @override
  void onInit() {
    splashTimer();

    // TODO: implement onInit
    super.onInit();
  }

  Timer? time;

  splashTimer() {
    time = Timer(Duration(seconds: 2), () {
      Get.offAndToNamed("/home");
    });

    update();
  }

  @override
  void onClose() {
    time!.cancel();

    // TODO: implement onClose
    super.onClose();
  }
}
