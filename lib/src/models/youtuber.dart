import 'package:ccd_youtube_flutter/src/models/statistics.dart';
import 'package:ccd_youtube_flutter/src/models/video.dart';

class Youtuber {
  Youtuber({
    required this.snippet,
    required this.statistics,
  });

  Snippet snippet;
  Statistics statistics;

  factory Youtuber.fromJson(Map<String, dynamic> json) => Youtuber(
        snippet: Snippet.fromJson(json['snippet']),
        statistics: Statistics.fromJson(json['statistics']),
      );
}
