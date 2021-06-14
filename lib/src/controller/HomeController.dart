import 'package:ccd_youtube_flutter/src/models/youtube_video_result.dart';
import 'package:ccd_youtube_flutter/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult().obs;

  @override
  void onInit() {
    _videoLoad();
    super.onInit();
  }

  void _videoLoad() async {
    YoutubeVideoResult youtubeVideoResult =
        await YoutubeRepository.to.loadVideos();

    (youtubeVideoResult.items?.length?.isGreaterThan(0) ?? false)
        ? youtubeResult(youtubeVideoResult)
        : '';
  }
}
