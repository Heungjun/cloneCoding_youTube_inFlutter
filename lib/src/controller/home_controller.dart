import 'package:ccd_youtube_flutter/src/models/youtube_video_result.dart';
import 'package:ccd_youtube_flutter/src/repository/youtube_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  late Rx<YoutubeVideoResult> youtubeVideoResult;
  RxBool isInit = false.obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    _videoLoad();
    _event();
    super.onInit();
  }

  void _videoLoad() async {
    YoutubeVideoResult _youtubeVideoResult =
        await YoutubeRepository.to.loadVideos('');

    youtubeVideoResult = _youtubeVideoResult.obs;
    isInit(true);
  }

  void _videoReLoad() async {
    YoutubeVideoResult _youtubeVideoResult = await YoutubeRepository.to
        .loadVideos(youtubeVideoResult.value.nextPageToken);

    youtubeVideoResult.update((val) {
      val!.nextPageToken = _youtubeVideoResult.nextPageToken;
      val.items.addAll(_youtubeVideoResult.items);
    });
    isInit(true);
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeVideoResult.value.nextPageToken != '') {
        _videoReLoad();
      }
    });
  }
}
