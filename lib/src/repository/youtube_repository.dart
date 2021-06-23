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
        '/youtube/v3/search?part=snippet&maxResult=10&type=channel&key=AIzaSyBbD9e0IS6Q5ZRieb5HV-KoouyG1tuqNBM&q=개발하는남&pageToken=$nextPageToken';
    final response = await get(url);

    if (response.status.hasError)
      return Future.error(response.statusText!);
    else {
      if (response.body['items'] != null && response.body['items'].length > 0)
        return YoutubeVideoResult.fromJson(response.body);
      else
        return Future.error(response.statusText!);
    }
  }

  Future<YoutubeVideoResult> search(
      String searchKeyword, String nextPageToken) async {
    String url =
        '/youtube/v3/search?part=snippet&maxResult=10&order=date&type=video&videoDefinition=high&key=AIzaSyBbD9e0IS6Q5ZRieb5HV-KoouyG1tuqNBM&pageToken=$nextPageToken&q=$searchKeyword';
    final response = await get(url);

    if (response.status.hasError)
      return Future.error(response.statusText!);
    else {
      if (response.body['items'] != null && response.body['items'].length > 0)
        return YoutubeVideoResult.fromJson(response.body);
      else
        return Future.error(response.statusText!);
    }
  }

  Future<Statistics> getVideoInfoById(String videoId) async {
    String url =
        '/youtube/v3/videos?part=snippet, statistics&key=AIzaSyBbD9e0IS6Q5ZRieb5HV-KoouyG1tuqNBM&id=$videoId';
    final response = await get(url);

    if (response.status.hasError)
      return Future.error(response.statusText!);
    else {
      if (response.body['items'] != null && response.body['items'].length > 0) {
        Map<String, dynamic> data = response.body['items'][0];
        return Statistics.fromJson(data['statistics']);
      } else
        return Future.error(response.statusText!);
    }
  }

  Future<Youtuber> getYoutuberInfoById(String channelId) async {
    String url =
        '/youtube/v3/channels?part=statistics,snippet&key=AIzaSyBbD9e0IS6Q5ZRieb5HV-KoouyG1tuqNBM&id=$channelId';
    final response = await get(url);

    if (response.status.hasError)
      return Future.error(response.statusText!);
    else {
      if (response.body['items'] != null && response.body['items'].length > 0) {
        Map<String, dynamic> data = response.body['items'][0];
        return Youtuber.fromJson(data);
      } else
        return Future.error(response.statusText!);
    }
  }
}
