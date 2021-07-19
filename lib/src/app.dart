import 'package:ccd_youtube_flutter/src/controller/app_controller.dart';
import 'package:ccd_youtube_flutter/src/controller/home_controller.dart';
import 'package:ccd_youtube_flutter/src/pages/explore.dart';
import 'package:ccd_youtube_flutter/src/pages/home.dart';
import 'package:ccd_youtube_flutter/src/pages/library.dart';
import 'package:ccd_youtube_flutter/src/pages/subscribe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (RouteName.values[controller.currentIndex.value]) {
          case RouteName.Home:
            return Home(
              controller: Get.put(HomeController()),
            );
          case RouteName.Explore:
            return Explore();
          case RouteName.Add:
            return Container();
          case RouteName.Subscribe:
            return Subscribe();
          case RouteName.Library:
            return Library();
        }
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/icons/home_off.svg'),
                activeIcon: SvgPicture.asset('assets/svg/icons/home_on.svg'),
                label: '홈'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/icons/compass_off.svg',
                  width: 22,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/svg/icons/compass_on.svg',
                  width: 22,
                ),
                label: '탐색'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SvgPicture.asset(
                    'assets/svg/icons/plus.svg',
                    width: 35,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/icons/subs_off.svg'),
                activeIcon: SvgPicture.asset('assets/svg/icons/subs_on.svg'),
                label: '구독'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/icons/library_off.svg'),
                activeIcon: SvgPicture.asset('assets/svg/icons/library_on.svg'),
                label: '보관함'),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          showSelectedLabels: true,
          selectedItemColor: Colors.black,
          onTap: (index) => controller.changePageIndex(index),
        ),
      ),
    );
  }
}
