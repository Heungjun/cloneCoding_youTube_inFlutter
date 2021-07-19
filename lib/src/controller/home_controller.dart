import 'package:ccd_youtube_flutter/src/models/youtube_video_result.dart';
import 'package:ccd_youtube_flutter/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  late Rx<YoutubeVideoResult> youtubeVideoResult;
  RxBool isInit = false.obs;

  @override
  void onInit() {
    _videoLoad();
    super.onInit();
  }

  void _videoLoad() async {
    YoutubeVideoResult _youtubeVideoResult =
        await YoutubeRepository.to.loadVideos();

    youtubeVideoResult = _youtubeVideoResult.obs;
    isInit(true);
  }
}
