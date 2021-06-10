import 'package:ccd_youtube_flutter/src/components/youtube_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum RouteName { Home, Explore, Add, Subscribe, Library }

class AppController extends GetxService {
  static AppController get to => Get.find();

  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    if (RouteName.values[index] == RouteName.Add)
      _showButtomSheet();
    else
      currentIndex(index);
  }

  void _showButtomSheet() => Get.bottomSheet(YoutubeBottomSheet());
}
