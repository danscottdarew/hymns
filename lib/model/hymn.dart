import 'package:objectbox/objectbox.dart';

@Entity()
class Hymn {
  int id, number, numberOfVerses;
  String title, chorus, preview, content, type, language;
  List<String> verses;

  Store s;

  Hymn(
      {this.number,
      this.id,
      this.numberOfVerses,
      this.title,
      this.chorus,
      this.verses,
      this.content}) {}

  factory Hymn.fromDB() {
    return null;
  }

  @override
  String toString() {
    return 'Title: $title, content: $content';
  }
}
