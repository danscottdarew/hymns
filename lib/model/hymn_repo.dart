 import 'hymn.dart';

class HymnRepo{
  Future<List<Hymn>> fetchHymn(String input){
    return Future.delayed(Duration(seconds: 1), (){
      bool found = true;

      if(found){
        throw Error();
      }
    });
  }



}