 import 'package:catholic_classics_hymns/widgets/wire.dart';

import 'hymn.dart';

class HymnRepo{
  List<Hymn> fetchHymn(String input){

    Hymn q1 = Hymn(title: "iukvj fy", number: 9);
    Hymn q2 = Hymn(title: "iuf6jy", number: 19);

    List<Hymn> res = List<Hymn>();
    res.add(q1);
    res.add(q2);

        p('Repo fetching.. $input : $res ');
        return  res;

  }



}