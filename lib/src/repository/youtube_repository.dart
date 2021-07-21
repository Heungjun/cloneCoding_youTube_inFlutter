import 'package:ccd_youtube_flutter/src/models/statistics.dart';
import 'package:ccd_youtube_flutter/src/models/youtube_video_result.dart';
import 'package:ccd_youtube_flutter/src/models/youtuber.dart';
import 'package:get/get.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = 'https://www.googleapis.com';
    super.onInit();
  }

  Future<YoutubeVideoResult> loadVideos(String nextPageToken) async {
    String url =
        '/youtube/v3/search?part=snippet&channelId=UCbMGBIayK26L4VaFrs5jyBw&maxResult=10&order=date&type=video&videoDefinition=high&key=AIzaSyBbD9e0IS6Q5ZRieb5HV-KoouyG1tuqNBM&pageToken=$nextPageToken';
    final response = await get(url);

    if (response.status.hasError)
      return Future.error(response.statusText ?? '오류 발생');
    else {
      return YoutubeVideoResult.fromJson(response.body);
    }
  }

  Future<Statistics> getVideoInfoById(String videoId) async {
    String url =
        '/youtube/v3/videos?part=snippet, statistics&key=AIzaSyBbD9e0IS6Q5ZRieb5HV-KoouyG1tuqNBM&id=$videoId';
    final response = await get(url);

    if (response.status.hasError)
      return Future.error(response.statusText ?? '오류 발생');
    else {
      Map<String, dynamic> data = response.body['items'][0];
      return Statistics.fromJson(data['statistics']);
    }
  }

  Future<Youtuber> getYoutuberByInfo(String channelId) async {
    String url =
        '/youtube/v3/channels?part=statistics,snippet&key=AIzaSyBbD9e0IS6Q5ZRieb5HV-KoouyG1tuqNBM&id=$channelId';
    final response = await get(url);

    if (response.status.hasError)
      return Future.error(response.statusText ?? '오류 발생');
    else {
      Map<String, dynamic> data = response.body['items'][0];
      return Youtuber.fromJson(data);
    }
  }
}
