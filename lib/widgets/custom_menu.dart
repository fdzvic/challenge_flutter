import 'package:challenge_app/tools/dimens_extension.dart';
import 'package:challenge_app/widgets/card_person.dart';
import 'package:challenge_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomMenu extends StatefulWidget {
  const CustomMenu({
    super.key,
  });

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
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
    List<String> nameFavorites = ["Juana Ayala", "Luis Jimenez"];
    List<String> nameSaves = [
      "Adriana Salinas",
      "Alberto Torres",
      "Juana Ayala"
    ];
    return Column(
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                gradient: LinearGradient(
                    colors: [Color(0XFF2A2D32), Color(0XFF23262A)])),
            duration: const Duration(milliseconds: 200),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    "Contactos",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Icon(Icons.add, color: Colors.orange),
                      SizedBox(width: 10),
                      CustomText("Nuevo", textColor: Colors.orange)
                    ],
                  ),
                  const SizedBox(height: 20),
                  const CustomText("Favoritos"),
                  const SizedBox(height: 10),
                  Column(
                    children: List.generate(
                      nameFavorites.length,
                      (index) => CardPerson(name: nameFavorites[index]),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CustomText("Guardados"),
                  const SizedBox(height: 10),
                  Column(
                    children: List.generate(
                      nameSaves.length,
                      (index) => CardPerson(name: nameSaves[index]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
