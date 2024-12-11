import 'package:challenge_app/tools/buttons_info.dart';
import 'package:challenge_app/tools/path_icons.dart';
import 'package:challenge_app/widgets/custom_app_bar.dart';
import 'package:challenge_app/widgets/custom_text.dart';
import 'package:challenge_app/widgets/menu_move_money.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    List<ButtonsInfo> buttons = [
      ButtonsInfo(title: "Tansferir", icon: icons.moveMoney),
      ButtonsInfo(title: "Pagar", icon: icons.pay),
      ButtonsInfo(title: "Retirar", icon: icons.cashOut),
      ButtonsInfo(title: "Depositar", icon: icons.deposit)
    ];
    return Scaffold(
      backgroundColor: const Color(0xff1B1F22),
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: CustomAppBar()),
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MenuMoveMoney(buttons: buttons),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: AnimatedContainer(
                  width: double.infinity,
                  height: isExpanded ? 400 : 640,
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24)),
                      gradient: LinearGradient(
                          colors: [Color(0XFF2A2D32), Color(0XFF23262A)])),
                  duration: const Duration(seconds: 1),
                  child: const SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          "Contactos",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
