import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  Widget _logo() {
    return Container(
      child: Image.asset(
        'assets/Images/logo.png',
        width: 130,
      ),
    );
  }

  Widget _actions() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 23,
            height: 23,
            child: SvgPicture.asset('assets/svg/icons/bell.svg'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 23,
              height: 23,
              child: SvgPicture.asset('assets/svg/icons/search.svg'),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.5),
          backgroundImage: Image.network(
                  'https://yt3.ggpht.com/ytc/AAUvwniU0ZOGv47lDdGSQ8H004fQgwOAJRlobuCvXwNl=s48-c-k-c0x00ffffff-no-rj')
              .image,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _logo(),
          _actions(),
        ],
      ),
    );
  }
}
