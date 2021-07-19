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
        '/youtube/v3/search?part=snippet&channelId=UCbMGBIayK26L4VaFrs5jyBw&maxResult=10&order=date&type=video&videoDefinition=high&key=AIzaSyBbD9e0IS6Q5ZRieb5HV-KoouyG1tuqNBM';
    final response = await get(url);

    if (response.status.hasError)
      return Future.error(response.statusText ?? '오류 발생');
    else {
      return YoutubeVideoResult.fromJson(response.body);
    }
  }
}
