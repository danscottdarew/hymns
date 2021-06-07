import 'package:flutter/material.dart';

class ClassicScreen extends StatefulWidget {
  @override
  _ClassicScreenState createState() => _ClassicScreenState();
}

class _ClassicScreenState extends State<ClassicScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
