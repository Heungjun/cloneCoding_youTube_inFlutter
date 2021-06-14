import 'package:ccd_youtube_flutter/src/models/youtube_video_result.dart';
import 'package:get/get.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = 'https://www.googleapis.com';
    super.onInit();
  }

  Future<YoutubeVideoResult> loadVideos() async {
    String url =
        '/youtube/v3/search?part=snippet&maxResult=10&type=channel&key=AIzaSyBbD9e0IS6Q5ZRieb5HV-KoouyG1tuqNBM&q=개발하는남';
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
}
