import 'package:ccd_youtube_flutter/src/controller/video_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetailController extends GetxController {
  VideoController videoController = Get.find(tag: Get.parameters['videoId']);
  YoutubePlayerController playerController = YoutubePlayerController(
    initialVideoId: Get.parameters['videoId'] ?? '8950',
    flags: const YoutubePlayerFlags(
      mute: false,
      autoPlay: true,
      disableDragSeek: false,
      loop: false,
      isLive: false,
      forceHD: false,
      enableCaption: true,
    ),
  );

  @override
  void onInit() {
    print(videoController.video.snippet?.title);
    super.onInit();
  }

  String get title => videoController.video.snippet?.title ?? '개발하는 남자';
  String get viewCount => '조회수 ${videoController.statistics.value.viewCount} 회';
  String get publishedTime => DateFormat('yyyy-MM-dd')
      .format(videoController.video.snippet?.publishTime ?? DateTime.now());
  String get description =>
      videoController.video.snippet?.description ?? '개발하는 남자';

  String get likeCount => videoController.statistics.value.likeCount ?? '0';
  String get disLikeCount =>
      videoController.statistics.value.dislikeCount ?? '0';

  String get youtuberThumbnailUrl => videoController.youtuberThumbnailUrl;
  String get youtuberName =>
      videoController.youtuber.value.snippet?.title ?? '개발하는 남자';
}
