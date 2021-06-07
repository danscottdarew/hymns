import 'package:catholic_classics_hymns/model/hymn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HymnScreen extends StatefulWidget {
  static const id = 'hymn_screen';
  Hymn hymn;

  HymnScreen({Hymn hymn});

  @override
  _HymnScreenState createState() => _HymnScreenState();
}

class _HymnScreenState extends State<HymnScreen> {
  Hymn hymn;

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
          actions: [
            IconButton(
              icon: Icon(Icons.share),
              onPressed: null,
            )
          ],

        ),
        body: Container(
          child: Text(hymn.content,
            textWidthBasis: TextWidthBasis.parent,
          ),
        ),
      ),
    );
  }
}
