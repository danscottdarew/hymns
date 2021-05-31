class Hymn{
  int number, numberOfVerses;
  String title, chorus,preview ;
  var verses = {};

  Hymn({this.number, numberOfVerses, title, chorus, verses}){

  }

  factory Hymn.fromDB(){
    return null;
  }

}