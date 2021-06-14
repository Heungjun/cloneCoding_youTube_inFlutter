import 'package:ccd_youtube_flutter/src/models/statistics.dart';
import 'package:ccd_youtube_flutter/src/models/video.dart';
import 'package:ccd_youtube_flutter/src/models/youtuber.dart';
import 'package:ccd_youtube_flutter/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  Video video;
  VideoController({required this.video});
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;
  @override
  void onInit() async {
    Statistics loadStatistics =
        await YoutubeRepository.to.getVideoInfoById(video.id!.videoId!);
    statistics(loadStatistics);

    Youtuber loadYoutuber = await YoutubeRepository.to
        .getYoutuberInfoById(video.snippet!.channelId!);
    youtuber(loadYoutuber);
    super.onInit();
  }

  String get viewCountString => '조회수 ${statistics.value.viewCount ?? 0} 회';
  String get youtuberThumbnailUrl =>
      youtuber.value.snippet?.thumbnails?.medium?.url ??
      'https://cdn.iconscout.com/icon/free/png-256/user-1648810-1401302.png';
}
