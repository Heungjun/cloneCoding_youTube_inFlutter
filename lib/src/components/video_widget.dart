import 'package:ccd_youtube_flutter/src/models/video.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VideoWidget extends StatelessWidget {
  final Video video;
  const VideoWidget({Key? key, required this.video}) : super(key: key);

  Widget _thumbnail() {
    return Container(
      height: 250,
      color: Colors.grey.withOpacity(0.5),
      child: Image.network(
        video.snippet!.thumbnails!.medium!.url!,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.5),
            backgroundImage: Image.network(
                    'https://yt3.ggpht.com/ytc/AAUvwniU0ZOGv47lDdGSQ8H004fQgwOAJRlobuCvXwNl=s48-c-k-c0x00ffffff-no-rj')
                .image,
          ),
          SizedBox(width: 15),
          Expanded(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      video.snippet!.title!,
                      maxLines: 2,
                    ),
                  ),
                  IconButton(
                    alignment: Alignment.topCenter,
                    icon: Icon(
                      Icons.more_vert,
                    ),
                    iconSize: 18,
                    onPressed: () {},
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    video.snippet!.channelTitle!,
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.8)),
                  ),
                  Text('·'),
                  Text(
                    '조회수 1000회',
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.6)),
                  ),
                  Text('·'),
                  Text(
                    DateFormat('yyyy-MM-dd')
                        .format(video.snippet!.publishTime!),
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.6)),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _thumbnail(),
          _simpleDetailInfo(),
        ],
      ),
    );
  }
}
