import 'package:catholic_classics_hymns/model/hymn.dart';
import 'package:flutter/material.dart';

Color kPrimaryColor = Colors.lightBlueAccent;
var kBG = LinearGradient(colors: [Colors.greenAccent, Colors.red], );
const kSecondaryColor = Colors.purple;
const kTop = 40;
const kLeft = 34;
const kBottom  = 22;
const kRight = 21;

SnackBar snackBar( String content){
  return SnackBar(content: Text(content), );
}

AppBar ab({title}){
  return AppBar(
    elevation: 0,
    title: title,
    backgroundColor: kPrimaryColor,
  );
}

void p(String s){
  print(s);
}

Offset getMidPoint(BuildContext context){
  var m = MediaQuery.of(context);
  print('SCREEN SIZE: $m');
  return m.size.center(Offset.zero);
}

Size screenSize(BuildContext context){
  return MediaQuery.of(context).size;
}

class HymnNumber extends StatelessWidget {
  int number;
  bool isBig;

  HymnNumber(@required this.number,{ this.isBig = true});

  @override
  Widget build(BuildContext context) {
    String num;
    if(number < 10)
      num = '00' + number.toString();
    else if((number>=10) & (number < 100))
      num = '0' + number.toString();
    else
      num = number.toString();

    return Container(
      child: Text(num, style: TextStyle(
        fontSize: isBig? 36 : 21,
        fontWeight: FontWeight.bold,
        color: kSecondaryColor
      ),),
    );
  }
}

class HymnTitle extends StatelessWidget {
  String title;

  HymnTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 31, ),
      ),
    );
  }
}

class HymnPreview extends StatelessWidget {
  String preview;

  HymnPreview(this.preview);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(preview,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 31, ),
      ),
    );
  }
}

class ArrowIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 18,
      bottom: 12,
      child: Column(
        children: [
          Icon(Icons.arrow_upward, size: 40, color: Colors.white,),
          Icon(Icons.arrow_circle_down, size: 40, color: Colors.white,)
        ],
      ),
    );
  }
}

class Line extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Positioned(child: Container(color: Colors.white.withOpacity(0.5),),
      width: 1, top: 40, left: 40.0 + 32, bottom: 0,);
  }
}

class MusicNote extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Positioned(
          child: Icon(Icons.music_note_sharp, size: 34, color: Colors.blue,),
      left: 42.0 ,top: 02);
  }
}