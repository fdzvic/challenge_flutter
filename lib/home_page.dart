import 'package:challenge_app/tools/buttons_info.dart';
import 'package:challenge_app/tools/dimens_extension.dart';
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
  double _height = 400.0;
  late double _minHeight;
  late double _maxHeight;

  @override
  void didChangeDependencies() {
    _maxHeight = context.height(.88);
    _minHeight = context.height(.5);
    super.didChangeDependencies();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _height -= details.delta.dy;
      _height = _height.clamp(_minHeight, _maxHeight);
    });
  }

  void _onDragEnd(DragEndDetails details) {
    if (_height > (_maxHeight + _minHeight) / 2) {
      setState(() {
        _height = _maxHeight;
      });
    } else {
      setState(() {
        _height = _minHeight;
      });
    }
  }

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
                onVerticalDragUpdate: _onDragUpdate,
                onVerticalDragEnd: _onDragEnd,
                child: AnimatedContainer(
                  width: double.infinity,
                  height: _height,
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24)),
                      gradient: LinearGradient(
                          colors: [Color(0XFF2A2D32), Color(0XFF23262A)])),
                  duration: const Duration(milliseconds: 200),
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
