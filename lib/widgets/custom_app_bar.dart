import 'package:challenge_app/tools/path_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff1B1F22),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_outlined,
            color: Colors.white,
          ),
        ),
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset(icons.iconNotification))
      ],
    );
  }
}
