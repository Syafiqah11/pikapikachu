// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// class PikaJump extends StatefulWidget {
//   const PikaJump({Key? key}) : super(key: key);

//   @override
//   State<PikaJump> createState() => _PikaJumpState();
// }

// class _PikaJumpState extends State<PikaJump> with TickerProviderStateMixin {
//   bool selected = false;
//   int _counter = 0;

//   late AnimationController _animationController;
//   late Animation<Offset> _jumpAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _animationController =
//         AnimationController(vsync: this, duration: Duration(seconds: 1));
//     _jumpAnimation = Tween<Offset>(
//       begin: Offset(0.0, 0.0),
//       end: Offset(0.0, 0.7),
//     ).animate(CurvedAnimation(
//         parent: _animationController, curve: Curves.fastOutSlowIn));

//     _animationController.addListener(() => setState(() {}));
//     _animationController.repeat(reverse: true);
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _incrementCounter() {
//     setState(() {
//       selected = !selected;
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {}
// }
