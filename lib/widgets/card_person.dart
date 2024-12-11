import 'package:challenge_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CardPerson extends StatelessWidget {
  const CardPerson({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      child: Row(
        children: [
          const CircleAvatar(),
          const SizedBox(width: 10),
          CustomText(name),
          const Expanded(child: SizedBox(width: 20)),
          const Icon(
            Icons.more_vert,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
