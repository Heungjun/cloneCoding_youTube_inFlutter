import 'package:ccd_youtube_flutter/src/app.dart';
import 'package:ccd_youtube_flutter/src/binding/init_binding.dart';
import 'package:ccd_youtube_flutter/src/components/youtube_detail.dart';
import 'package:ccd_youtube_flutter/src/controller/youtube_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Youtube Clone App',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: InitBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => App()),
        GetPage(
          name: '/detail/:videoId',
          page: () => YoutubeDetail(),
          binding: BindingsBuilder(
            () => Get.lazyPut<YoutubeDetailController>(
              () => YoutubeDetailController(),
            ),
          ),
        ),
      ],
    );
  }
}
