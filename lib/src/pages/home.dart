import 'package:ccd_youtube_flutter/src/components/video_widget.dart';
import 'package:ccd_youtube_flutter/src/controller/custom_appbar.dart';
import 'package:ccd_youtube_flutter/src/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.controller}) : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => controller.isInit.value == false
            ? LinearProgressIndicator()
            : CustomScrollView(
                controller: controller.scrollController,
                slivers: [
                  SliverAppBar(
                    title: CustomAppBar(),
                    floating: true,
                    snap: true,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed('/detail/239587');
                          },
                          child: VideoWidget(
                              video: controller
                                  .youtubeVideoResult.value.items[index]),
                        );
                      },
                      childCount:
                          controller.youtubeVideoResult.value.items.length,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
