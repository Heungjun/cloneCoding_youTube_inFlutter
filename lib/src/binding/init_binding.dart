import 'package:ccd_youtube_flutter/src/controller/app_controller.dart';
import 'package:ccd_youtube_flutter/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(YoutubeRepository(), permanent: true);
    Get.put(AppController());
  }
}
