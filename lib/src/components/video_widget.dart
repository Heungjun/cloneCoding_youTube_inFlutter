import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccd_youtube_flutter/src/controller/video_controller.dart';
import 'package:ccd_youtube_flutter/src/models/video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoController _videoController;
  @override
  void initState() {
    _videoController = Get.put(VideoController(video: widget.video),
        tag: widget.video.id.videoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _videoController.isInit == false
          ? LinearProgressIndicator()
          : Column(
              children: [_thumbnail(), _simpleDetailInfo()],
            ),
    );
  }

  _thumbnail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.grey.withOpacity(0.5),
          // child: Image.network(
          //   widget.video.snippet.thumbnails.medium.url,
          //   fit: BoxFit.fitWidth,
          // ),
          child: CachedNetworkImage(
            imageUrl: _videoController.youtuberThumbnailUrl,
            placeholder: (context, url) => Container(
              height: 230,
              child: Center(child: CircularProgressIndicator()),
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }

  _simpleDetailInfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 20),
      child: Row(
        children: [
          Obx(
            () => CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.withOpacity(0.5),
              backgroundImage:
                  Image.network(_videoController.youtuberThumbnailUrl).image,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.video.snippet.title,
                        maxLines: 2,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        size: 18,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      widget.video.snippet.channelTitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Text('ㆍ'),
                    Obx(
                      () => Text(
                        _videoController.viewCountString,
                        // _videoController.statistic.value.viewCount,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                    Text('ㆍ'),
                    Text(
                      DateFormat('yyyy-MM-dd')
                          .format(widget.video.snippet.publishTime!),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
