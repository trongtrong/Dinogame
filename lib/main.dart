import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:test_game/game/game.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  await Flame.util.setLandscape();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DinoGame dinoGame;
  @override
  void initState() {
    super.initState();
    dinoGame = DinoGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('asdsad'),
      ),
      body: dinoGame.widget,
    );
  }
}
