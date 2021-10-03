import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Keys(),
        ),
      ),
    );
  }
}

class Keys extends StatefulWidget {
  // const ({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Keys> {
  List<Widget> buildKey() {
    return [
      KeyButton(1, Colors.red),
      KeyButton(2, Colors.orange),
      KeyButton(3, Colors.yellow),
      KeyButton(4, Colors.green),
      KeyButton(5, Colors.green.shade700),
      KeyButton(6, Colors.blue),
      KeyButton(7, Colors.purple),
    ].toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: buildKey(),
    );
  }
}

class KeyButton extends StatelessWidget {
  // const ({Key? key}) : super(key: key);

  KeyButton(this.index, this.color);

  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
          color: color,
          onPressed: () {
            this.playSound(index);
          }),
    );
  }

  void playSound(int keyValue) {
    if (keyValue == null) {
      return;
    }
    final player = new AudioCache();
    player.play('note$keyValue.wav');
  }
}
