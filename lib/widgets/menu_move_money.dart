import 'package:challenge_app/tools/buttons_info.dart';
import 'package:challenge_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuMoveMoney extends StatelessWidget {
  const MenuMoveMoney({
    super.key,
    required this.buttons,
  });

  final List<ButtonsInfo> buttons;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            "Mover dinero",
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 200,
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  childAspectRatio: 2,
                  mainAxisSpacing: 5),
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0XFF2A2D32), Color(0XFF23262A)])),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(buttons[index].title),
                      const SizedBox(height: 5),
                      SvgPicture.asset(buttons[index].icon)
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
