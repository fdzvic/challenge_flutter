import 'package:challenge_app/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SlidingUpMenu(),
//     );
//   }
// }

// class SlidingUpMenu extends StatefulWidget {
//   @override
//   _SlidingUpMenuState createState() => _SlidingUpMenuState();
// }

// class _SlidingUpMenuState extends State<SlidingUpMenu> {
//   double _height = 100.0; // Altura inicial
//   final double _minHeight = 100.0; // Altura mínima
//   final double _maxHeight = 500.0; // Altura máxima

//   void _onDragUpdate(DragUpdateDetails details) {
//     setState(() {
//       // Incrementa o reduce la altura según el movimiento vertical
//       _height -= details.delta.dy;
//       // Limita la altura entre el mínimo y el máximo
//       _height = _height.clamp(_minHeight, _maxHeight);
//     });
//   }

//   void _onDragEnd(DragEndDetails details) {
//     // Puedes implementar un comportamiento adicional aquí, como hacer que
//     // el contenedor "salte" al mínimo o máximo dependiendo de la posición actual.
//     if (_height > (_maxHeight + _minHeight) / 2) {
//       setState(() {
//         _height = _maxHeight; // Expande completamente
//       });
//     } else {
//       setState(() {
//         _height = _minHeight; // Colapsa al mínimo
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Menu deslizable')),
//       body: Stack(
//         children: [
//           // Contenido principal detrás del menú
//           ListView.builder(
//             itemCount: 50,
//             itemBuilder: (context, index) => ListTile(
//               title: Text('Elemento $index'),
//             ),
//           ),
//           // Contenedor deslizable
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: GestureDetector(
//               onVerticalDragUpdate: _onDragUpdate,
//               onVerticalDragEnd: _onDragEnd,
//               child: AnimatedContainer(
//                 duration: Duration(milliseconds: 200),
//                 curve: Curves.easeInOut,
//                 height: _height,
//                 width: double.infinity,
//                 color: Colors.blue,
//                 child: Center(
//                   child: Text(
//                     'Arrastra para ajustar',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
