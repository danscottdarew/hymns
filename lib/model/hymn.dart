class Hymn{
  int number, numberOfVerses;
  String title, chorus, preview, content ;
  var verses = {};

  Hymn({this.number, this.numberOfVerses, this.title, this.chorus, this.verses, this.content}){

  }

  factory Hymn.fromDB(){
    return null;
  }

  @override
  String toString(){
    return 'Title: $title, content: $content';
  }

}