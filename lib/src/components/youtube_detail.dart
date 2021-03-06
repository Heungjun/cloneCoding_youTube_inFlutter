import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class YoutubeDetail extends StatelessWidget {
  const YoutubeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 250,
            color: Colors.grey.withOpacity(0.5),
          ),
          Expanded(child: _description())
        ],
      ),
    );
  }

  Widget get line => Container(height: 1, color: Colors.black.withOpacity(0.1));

  _description() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _titleZone(),
          line,
          _descriptionZone(),
          _buttonZone(),
          SizedBox(height: 20),
          line,
          _ownerZone(),
        ],
      ),
    );
  }

  _titleZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '개발하는 남자 유튜브 영상 다시보기',
            style: TextStyle(fontSize: 15),
          ),
          Row(
            children: [
              Text(
                '조회수 1000회',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Text('ㆍ'),
              Text(
                '2021-07-19',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _descriptionZone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
      child: Text(
        '안녕하세요. 개발하는 남자 개남입니다.',
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  _buttonZone() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buttonOne(iconPath: 'like', text: '1000'),
        _buttonOne(iconPath: 'dislike', text: '0'),
        _buttonOne(iconPath: 'share', text: '공유'),
        _buttonOne(iconPath: 'save', text: '저장'),
      ],
    );
  }

  _buttonOne({required String iconPath, required String text}) {
    return Column(
      children: [
        SvgPicture.asset('assets/svg/icons/$iconPath.svg'),
        Text(text)
      ],
    );
  }

  _ownerZone() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.withOpacity(0.5),
            backgroundImage: Image.network(
                    'https://yt3.ggpht.com/ytc/AKedOLQagIEl2WOUacXZ8WlCPvApoIouP9sNGkMIDVdQ=s88-c-k-c0x00ffffff-no-rj')
                .image,
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '개발하는남자',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '구독자 10000',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Text(
              '구독',
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
