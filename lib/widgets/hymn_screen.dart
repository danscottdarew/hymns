import 'package:catholic_classics_hymns/model/hymn.dart';
import 'package:flutter/material.dart';

class HymnScreen extends StatefulWidget {
  Hymn hymn;

  HymnScreen({Hymn hymn});

  @override
  _HymnScreenState createState() => _HymnScreenState();
}

class _HymnScreenState extends State<HymnScreen> {
  var hymn;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hymn = widget.hymn;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Hymn ${hymn.number}'),
          leading: Icon(Icons.menu,
            color: Color(0x00AEF9), ),
          actions: [Icon(Icons.share, )],
        ),
        body: Container(),
      ),
    );
  }
}
