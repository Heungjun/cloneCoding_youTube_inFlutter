import 'package:ccd_youtube_flutter/src/models/youtube_video_result.dart';
import 'package:ccd_youtube_flutter/src/repository/youtube_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YoutubeSearchController extends GetxController {
  String key = 'SearchKey';
  RxList<String> history = RxList<String>.empty(growable: true);
  Set<String> originHistory = {};
  late SharedPreferences profs;
  ScrollController scrollController = ScrollController();
  late String _currentKeyword;
  Rx<YoutubeVideoResult> youtubeVideoResult = YoutubeVideoResult(items: []).obs;
  @override
  void onInit() async {
    _event();
    profs = await SharedPreferences.getInstance();
    List<dynamic> initData = profs.get(key) as List<dynamic>;
    originHistory.addAll(initData.map((e) => e.toString()).toList());
    history(originHistory.toList());
    super.onInit();
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeVideoResult.value.nextPageToken != '')
        _searchYoutube(_currentKeyword);
    });
  }

  void search(String search) {
    history.clear();
    originHistory.add(search);
    history.addAll(originHistory.toList());
    profs.setStringList(key, originHistory.toList());

    // history.addIf(!history.contains(search), search);

    _currentKeyword = search;
    _searchYoutube(search);
  }

  void _searchYoutube(String searchKey) async {
    YoutubeVideoResult youtubeVideoResultFromServer = await YoutubeRepository.to
        .search(searchKey, youtubeVideoResult.value.nextPageToken ?? '');

    (youtubeVideoResultFromServer.items.length.isGreaterThan(0))
        ? youtubeVideoResult.update((youtube) {
            youtube!.nextPageToken = youtubeVideoResultFromServer.nextPageToken;
            youtube.items.addAll(youtubeVideoResultFromServer.items);
          })
        : '';
  }
}
