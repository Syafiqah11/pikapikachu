import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Pokemon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool selected = false;
  int _counter = 0;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _jumpAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _slideAnimation = Tween<Offset>(
      begin: Offset(-1.5, 0.0),
      end: Offset(1.5, 0.0),
    ).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.elasticInOut));
    _jumpAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(0.0, 0.7),
    ).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));

    _animationController.addListener(() => setState(() {}));
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      selected = !selected;
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Score: ',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
          SizedBox(height: 50),
          Container(
              width: 200,
              height: 200,
              child: SlideTransition(
                position: _jumpAnimation,
                child: Image(image: AssetImage('images/jump.png')),
              )),
          SizedBox(height: 75),
          Container(
              width: 100,
              height: 100,
              child: SlideTransition(
                position: _slideAnimation,
                child: Image(image: AssetImage('images/stone.png')),
              )),
          SizedBox(height: 75),
          ElevatedButton(
              onPressed: () {
                _incrementCounter();
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.amber[900])),
              child: const Text("Jump!")),
        ],
      ),
    );
  }
}

//Custom Curve animation
class SinCurve extends Curve {
  const SinCurve([this.period = 3]);

  final double period;

  @override
  double transformInternal(double t) {
    return math.sin(period * 2 * math.pi * t) * 0.5 + 0.5;
  }
}
