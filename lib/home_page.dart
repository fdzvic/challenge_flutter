import 'package:challenge_app/tools/buttons_info.dart';
import 'package:challenge_app/tools/path_icons.dart';
import 'package:challenge_app/widgets/custom_app_bar.dart';
import 'package:challenge_app/widgets/custom_menu.dart';
import 'package:challenge_app/widgets/menu_move_money.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          const CustomMenu()
        ],
      )),
    );
  }
}
