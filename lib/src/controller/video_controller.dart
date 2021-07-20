import 'package:ccd_youtube_flutter/src/models/statistics.dart';
import 'package:ccd_youtube_flutter/src/models/video.dart';
import 'package:ccd_youtube_flutter/src/models/youtuber.dart';
import 'package:ccd_youtube_flutter/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  final Video video;
  VideoController({required this.video});
  late Rx<Statistics> statistic;
  late Rx<Youtuber> youtuber;
  RxBool _isInit = false.obs;

  String get viewCountString => '조회수 ${statistic.value.viewCount}회';
  String get youtuberThumbnailUrl =>
      youtuber.value.snippet.thumbnails.medium.url;
  bool get isInit => _isInit.value;

  @override
  Future<void> onInit() async {
    Statistics loadStatistics =
        await YoutubeRepository.to.getVideoInfoById(video.id.videoId);
    statistic = loadStatistics.obs;

    Youtuber loadYoutuber =
        await YoutubeRepository.to.getYoutuberByInfo(video.snippet.channelId);
    youtuber = loadYoutuber.obs;

    _isInit(true);
    super.onInit();
  }
}
